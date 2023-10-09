//
//  HTClassButtonView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/10.
//

import UIKit

class HTClassButtonView: HTClassBaseView {
    var var_imgSize = CGSizeMake(16, 16)
    var var_imageInsets = UIEdgeInsets(top: 10.auto(), left: 10.auto(), bottom: 0, right: 0)
    var var_titleInsets =  UIEdgeInsets(top: 13.auto(), left: 4.auto(), bottom: 13.auto(), right: 0)
    var var_space = 2
    var var_position = 0
    var var_center = false
    lazy var var_stackView:UIStackView = {
        let var_stackView = UIStackView()
        return var_stackView
    }()
    lazy var var_label = {
        let var_label = UILabel()
        var_label.textColor = .ht_colorHex(var_rgbValue: 0xC1C1C1)
        var_label.font = .systemFont(ofSize: 15)
        return var_label
    }()
    
    lazy var var_icon = {
        let var_icon = UIImageView()
        var_icon.contentMode = .scaleAspectFit
        var_icon.clipsToBounds = true 
        return var_icon
    }()
    
    func ht_updateContent(){
        setNeedsUpdateConstraints()
    }
    
    override func ht_setupViews() {
        addSubview(var_label)
        addSubview(var_icon)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if var_position == 0 {
            if var_center {
                addSubview(var_stackView)
                var_stackView.snp.remakeConstraints { make in
                    make.center.equalToSuperview()
                    make.top.equalTo(var_titleInsets.top)
                    make.bottom.equalTo(-var_titleInsets.bottom)
                }
                var_stackView.addArrangedSubview(var_icon)
                var_stackView.addArrangedSubview(var_label)
                var_icon.snp.updateConstraints { make in
                    make.size.equalTo(var_imgSize)
                }
                var_stackView.spacing = var_titleInsets.left
            }else{
                ///图左文右
                var_icon.snp.remakeConstraints { make in
                    make.size.equalTo(var_imgSize)
                    make.centerY.equalToSuperview()
                    make.left.equalTo(var_imageInsets.left)
                }
                
                var_label.snp.remakeConstraints { make in
                    make.left.equalTo(var_icon.snp.right).offset(var_titleInsets.left)
                    make.top.equalTo(var_titleInsets.top)
                    make.bottom.equalTo(-var_titleInsets.bottom)
                    make.right.equalTo(-var_titleInsets.right)
                }
            }
        }
        
        else if var_position == 1 {
            ///图右文左
            var_label.snp.remakeConstraints { make in
                make.left.equalTo(var_titleInsets.left)
                make.top.equalTo(var_titleInsets.top)
                make.bottom.equalTo(-var_titleInsets.bottom)
            }
            
            var_icon.snp.remakeConstraints { make in
                make.size.equalTo(var_imgSize)
                make.centerY.equalToSuperview()
                make.right.equalTo(-var_imageInsets.right)
                make.left.equalTo(var_label.snp.right).offset(var_imageInsets.left)
            }
            
        }
        ///图上问下
        else if var_position == 2 {
            var_icon.snp.remakeConstraints { make in
                make.top.equalTo(var_imageInsets.top)
                make.centerX.equalToSuperview()
                make.size.equalTo(var_imgSize)
            }
            var_label.snp.remakeConstraints { make in
                make.left.equalTo(var_titleInsets.left)
                make.right.equalTo(-var_titleInsets.right)
                make.top.equalTo(var_icon.snp.bottom).offset(var_titleInsets.top)
                make.bottom.equalTo(-var_titleInsets.bottom)
            }
            
        }
    }
}
