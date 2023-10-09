//
//  HTClassCollectionView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/13.
//

import UIKit

class HTClassCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        ht_commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ht_commonInit()
    }
    
    func ht_commonInit(){
        keyboardDismissMode = .onDrag
        automaticallyAdjustsScrollIndicatorInsets = false
    }
}
