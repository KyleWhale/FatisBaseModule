//
//  HTClassLabel.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit

class HTClassLabel: UILabel {
    var var_insets:UIEdgeInsets = .zero
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: var_insets))
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let var_insets = var_insets
        var var_rect = super.textRect(forBounds: bounds.inset(by: var_insets), limitedToNumberOfLines: numberOfLines)
        var_rect.origin.x -= var_insets.left
        var_rect.origin.y -= var_insets.top
        var_rect.size.width += (var_insets.left + var_insets.right)
        var_rect.size.height += (var_insets.top + var_insets.bottom)
        return var_rect
    }
}
