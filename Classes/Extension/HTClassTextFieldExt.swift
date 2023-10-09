//
//  HTClassTextFieldExt.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/13.
//

import Foundation
extension UITextField {
    var var_empty: Bool {
        if let var_text = self.text, !var_text.isEmpty {
             return false
        }
        return true
    }
}
