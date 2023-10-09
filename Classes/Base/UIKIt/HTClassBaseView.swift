//
//  HTClassBaseView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit

typealias BLOCK_TapBlock = (_ var_view: UIView)->Void
typealias BLOCK_BTNClickBlock = (_ var_object: Any?)->Void
typealias BLOCK_TagBlock = (_ var_tag: Int)->Void
class HTClassBaseView: UIView {
    open var var_click : BLOCK_TapBlock?
    lazy var var_scrollView:UIScrollView = {
        let var_scrollView = UIScrollView()
        var_scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        return var_scrollView
    }()
    
    lazy var var_scrollContainView:UIView = {
        let var_scrollContainView = UIView()
        return var_scrollContainView
    }()
    
    lazy var var_scrollStackView:UIStackView = {
        let var_scrollStackView = UIStackView()
        return var_scrollStackView
    }()
    
    open func ht_addVerticalScrollAction(){
        addSubview(var_scrollView)
        var_scrollStackView.axis = .vertical
        var_scrollView.addSubview(var_scrollContainView)
        var_scrollContainView.addSubview(var_scrollStackView)
        var_scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        var_scrollContainView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        var_scrollStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    open func ht_addHorizontalScrollAction(){
        addSubview(var_scrollView)
        var_scrollStackView.axis = .horizontal
        var_scrollView.addSubview(var_scrollContainView)
        var_scrollContainView.addSubview(var_scrollStackView)
        var_scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        var_scrollContainView.snp.makeConstraints { make in
            make.edges.height.equalToSuperview()
        }
        var_scrollStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ht_commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ht_commonInit()
    }
    
    func ht_commonInit(){
        ht_setupViews()
        ht_getNewData()
//        let var_tap = UITapGestureRecognizer(target: self, action: #selector(ht_tapAction))
//        addGestureRecognizer(var_tap)
    }
    
    @objc open func ht_tapAction(){
        if let var_click = var_click {
            var_click(self)
        }
    }
    
    open func ht_setupViews() {
        
    }
    
    open func ht_getNewData() {
        
    }
    
    open func ht_updateData() {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
