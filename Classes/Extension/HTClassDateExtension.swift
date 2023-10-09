//
//  DataExtension.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/12.
//

import Foundation

extension Date{
    func ht_toStr(var_dateFormat:String = ht_AsciiString("yyyy-MM-dd")) -> String{
        let var_format = DateFormatter()
        var_format.dateFormat = var_dateFormat
        return var_format.string(from: self)
    }
}
