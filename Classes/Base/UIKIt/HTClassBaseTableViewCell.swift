//
//  HTClassBaseTableViewCell.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/13.
//

import UIKit

class HTClassBaseTableViewCell: UITableViewCell {
    
    open func ht_addCellSubViews(){
        
    }
    
    open func ht_updateCellWithData(){
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ht_commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ht_commonInit()
    }
    
    func ht_commonInit(){
        contentView.backgroundColor = .STATIC_bg
        selectionStyle = .none
        ht_addCellSubViews()
        setNeedsUpdateConstraints()
    }
}
