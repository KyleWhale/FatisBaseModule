//
//  HTClassTableView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/13.
//

import UIKit

class HTClassTableView: UITableView {
    
    override init(frame: CGRect,style:UITableView.Style) {
        super.init(frame: frame,style:style)
        ht_commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ht_commonInit()
    }
    
    func ht_commonInit(){
        separatorStyle = .none
        estimatedRowHeight = 44
        keyboardDismissMode = .onDrag
        estimatedSectionFooterHeight = 0
        estimatedSectionHeaderHeight = 0
        contentInsetAdjustmentBehavior = .never
        automaticallyAdjustsScrollIndicatorInsets = false
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        }
        backgroundColor = .STATIC_bg
        showsHorizontalScrollIndicator = false
        tableHeaderView = UIView(frame: .zero)
        tableFooterView = UIView(frame: .zero)
    }
}
