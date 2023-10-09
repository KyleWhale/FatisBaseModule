//
//  HTClassButton.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit

class HTClassButton: UIButton {
    override var isHighlighted: Bool{
        set{
                    
        }
        get {
            return false
        }
    }
    
    var var_timer:Timer?
    var var_count = 0
    var var_allCount = 0
    var var_send = false

    func ht_timeFailBeginFrom(var_timeCount:Int){
        var_allCount = var_timeCount
        var_count = var_timeCount
        isEnabled = false
        if var_timer != nil {
            var_timer?.invalidate()
            var_timer = nil
        }
        var_timer = Timer(timeInterval: 1, repeats: true, block: {[weak self] timer in
            guard let this = self else { return }
            this.ht_updateTimer()
        })
        RunLoop.current.add(var_timer!, forMode: .common)
        ht_updateTimer()
        var_send = true
    }
    
    func ht_updateTimer(){
        let string = ht_AsciiString("Re-send verification code")
        if var_count > 0 {
            var_count -= 1
            if isEnabled {
                isEnabled  = false
            }
            self.setTitle("\(string) ( \(var_count) )", for: .normal)
            self.setTitleColor(.ht_colorHex(var_rgbValue: 0x828386), for: .normal)
        }else{
            if !self.isEnabled {
                self.isEnabled = true
            }
            self.setTitle(string, for: .normal)
            self.setTitleColor(.ht_colorHex(var_rgbValue: 0x3CDEF4), for: .normal)
            self.var_timer?.invalidate()
            self.var_timer = nil
            self.var_send = false
        }
    }
    
    deinit{
        if var_timer != nil {
            var_timer?.invalidate()
            var_timer = nil
        }
    }
}

typealias BLOCK_ActionBlock = ((UIButton)->Void)

extension UIButton {
    private struct HTClassAssociatedKeys {
        static var var_ActionBlock = "udf_ActionBlock"
        static var var_ActionDelay = "udf_ActionDelay"
    }
    
    private var var_ActionBlock: BLOCK_ActionBlock? {
        set {
            objc_setAssociatedObject(self, &HTClassAssociatedKeys.var_ActionBlock, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &HTClassAssociatedKeys.var_ActionBlock) as? BLOCK_ActionBlock
        }
    }
    
    private var var_actionDelay: TimeInterval {
        set {
            objc_setAssociatedObject(self, &HTClassAssociatedKeys.var_ActionDelay, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &HTClassAssociatedKeys.var_ActionDelay) as? TimeInterval ?? 0
        }
    }
    
    @objc private func ht_btnDelayClick(var_button: UIButton) {
        var_ActionBlock?(var_button)
        isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + var_actionDelay) { [weak self] in
            self?.isEnabled = true
        }
    }
    
    func ht_addAction(_ var_delay: TimeInterval = 0, var_action: @escaping BLOCK_ActionBlock) {
        addTarget(self, action: #selector(ht_btnDelayClick(var_button:)) , for: .touchUpInside)
        var_actionDelay = var_delay
        var_ActionBlock = var_action
    }
}
