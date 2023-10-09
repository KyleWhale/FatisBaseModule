//
//  HTClassResponerExt.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/13.
//

import Foundation

extension UIResponder{
    @objc func ht_respondEvent(var_event:HTClassEvent){
        self.next?.ht_respondEvent(var_event: var_event)
    }
}
