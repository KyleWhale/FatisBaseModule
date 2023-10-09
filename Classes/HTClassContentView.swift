//
//  HTClassContentView.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/9.
//

import UIKit

class HTClassContentView: HTClassBaseView {

    var var_dissmiss = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.var_dissmiss {
            self.endEditing(true)
        }
    }
}
