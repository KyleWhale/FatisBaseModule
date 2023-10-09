//
//  HTClassIconView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/8/18.
//

import UIKit

class HTClassIconView: HTClassButton {
    var var_size:CGSize = .init(width: 30, height: 30)
    lazy var var_iconIV:UIImageView = {
        let var_iconIV = UIImageView()
        return var_iconIV
    }()
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
    }
    
    func ht_setupViews(){
        addSubview(var_iconIV)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        var_iconIV.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(var_size)
        }
    }
}
