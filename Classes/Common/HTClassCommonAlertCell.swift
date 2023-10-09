//
//  HTClassCommonAlertCell.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/22.
//

import UIKit

class HTClassCommonAlertCell: HTClassBaseTableViewCell {

    var var_title = ""
    lazy var var_titleLB:UILabel = {
        let var_titleLB = UILabel()
        var_titleLB.textColor = .STATIC_EC
        var_titleLB.textAlignment = .center
        var_titleLB.font = .systemFont(ofSize: 16)
        return var_titleLB
    }()
    
    override func ht_addCellSubViews() {
        contentView.addSubview(var_titleLB)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        var_titleLB.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(53.auto())
        }
    }
    
    override func ht_updateCellWithData() {
        var_titleLB.text = var_title
        contentView.backgroundColor = .STATIC_00
    }

}
