//
//  HTClassAutoScrollLabel.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/18.
//

import UIKit
import SnapKit
import ObjectiveC
public class HTClassAutoScrollLabel: UIScrollView {
    var var_scrollSpeed = 100.0
    var var_pauseInterval = 2.0
    var var_hadScroll = false
    var var_textLabel:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        ht_commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ht_commonInit()
    }
    
    func ht_startScrollIfNeed(){
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        layoutIfNeeded()
        self.contentSize = self.var_textLabel.frame.size
        if ht_canScroll() {
            var_hadScroll = true
            ht_animationScroll()
        }
    }
    
    func ht_canScroll()->Bool{
        return self.var_textLabel.frame.size.width > self.frame.size.width
    }
    
    @objc func ht_animationScroll() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(ht_animationScroll), object: nil)
        if !ht_canScroll(){
            return
        }
        self.contentOffset = CGPointMake(-self.bounds.size.width, 0)
        UIView.animate(withDuration:self.var_textLabel.frame.size.width / var_scrollSpeed, delay: 0, options: .curveLinear,animations:{[weak self] in
            guard let self = self else { return }
            if self.ht_canScroll() {
                self.contentOffset = CGPointMake(self.var_textLabel.frame.size.width - self.bounds.size.width, 0)
            }else{
                self.contentOffset = .zero
            }
        },completion:{[weak self] finished in
            guard let self = self else { return }
            if self.ht_canScroll() {
                self.perform(#selector(self.ht_animationScroll), with: nil, afterDelay: self.var_pauseInterval)
            }else{
                self.contentOffset = .zero
            }
        })
    }
    
    func ht_commonInit(){
        var_scrollSpeed = 100
        var_pauseInterval = 2
        self.isScrollEnabled = false
        var_textLabel = UILabel()
        var_textLabel.textColor = .STATIC_EC
        var_textLabel.font = .systemFont(ofSize: 15, weight: .regular)
        addSubview(var_textLabel)
        var_textLabel.snp.remakeConstraints { make in
            make.height.top.left.right.bottom.equalToSuperview()
        }
    }
}
