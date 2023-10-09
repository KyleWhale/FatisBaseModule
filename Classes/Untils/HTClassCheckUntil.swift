//
//  HTClassCheckUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/11.
//

import Foundation

class HTClassCheckUntil{
    static let var_sharedInstance = HTClassCheckUntil()
    static func ht_convertDictionaryToString(var_dict:[String:Any]) -> String {
        var var_result = ""
        do {
            let var_jsonData = try JSONSerialization.data(withJSONObject: var_dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            if let var_JSONString = String(data: var_jsonData, encoding: String.Encoding.utf8) {
                var_result = var_JSONString
            }
        } catch {
            
        }
        return var_result
    }
    
}
