//
//  HTClassFitImageView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/13.
//

import UIKit

class HTClassFitImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentMode = .scaleAspectFit
    }
}
