//
//  HTClassBaseCollectionViewCell.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/13.
//

import UIKit

class HTClassBaseCollectionViewCell: UICollectionViewCell {
    open func ht_addCellSubViews(){
        
    }
    
    open func ht_updateCellWithData(){
        
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
        contentView.backgroundColor = .STATIC_bg
        ht_addCellSubViews()
        setNeedsUpdateConstraints()
    }
}
