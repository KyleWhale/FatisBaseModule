//
//  HTClassMutilangManager.swift
//  ProjectSwift
//
//  Created by 李雪健 on 2023/8/25.
//

import Foundation

class HTClassMutilangManager {
    
    static let `default` = HTClassMutilangManager()
    
    var var_dictionary: [String:String] = [:]
    
    func ht_requestLanguage() {
        
        if ht_judgeIfneedRequestLanguage(), HTClassSwitchManager.ht_switchStatus() {
            HTClassNetWordUntil().ht_request(url: 192) { [weak self] result, response, error in
                guard let this = self else {return}
                if result, let data = response as? [String: Any] {
                    if let var_dict = data[ht_AsciiString("iOS")] as? [String: Any] {
                        if var var_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
                            var_path = var_path.appending(ht_AsciiString("/Language"))
                            var var_isDirectory: ObjCBool = false
                            if !FileManager.default.fileExists(atPath: var_path, isDirectory: &var_isDirectory) {
                                do {
                                    try FileManager.default.createDirectory(atPath: var_path, withIntermediateDirectories: true)
                                } catch {
                                    print("create failed!")
                                }
                            }
                            var_path = this.ht_getLangPathString()
                            do {
                                let var_jsonData = try JSONSerialization.data(withJSONObject: var_dict)
                                if !FileManager.default.fileExists(atPath: var_path, isDirectory: &var_isDirectory) {
                                    if FileManager.default.createFile(atPath: var_path, contents: var_jsonData, attributes: nil) {
                                        this.ht_updateLanguage()
                                    }
                                } else {
                                    if let var_jsonString = String(data: var_jsonData, encoding: .utf8) {
                                        try var_jsonString.write(toFile: var_path, atomically: true, encoding: .utf8)
                                        this.ht_updateLanguage()
                                    }
                                }
                            } catch {}
                        }
                    }
                }
                HTClassSwitchManager.ht_updateRootWithChange(true)
            }
        } else {
            HTClassSwitchManager.ht_updateRootWithChange(false)
        }
    }
    
    func ht_updateLanguage() {
        ht_getLangfileData()
        let var_string = Bundle.main.infoDictionary![ht_AsciiString("CFBundleShortVersionString")] as? String
        UserDefaults.standard.set(var_string, forKey: "udf_budnum")
    }
    
    func ht_getLangfileData() {
        let var_path = ht_getLangfilePathString(ht_getLangPathString()) ?? ""
        var var_isDirectory: ObjCBool = false
        if FileManager.default.fileExists(atPath: var_path, isDirectory: &var_isDirectory) {
            if let var_jsonData = NSData.init(contentsOfFile: var_path) {
                do {
                    if let var_jsonDict = try JSONSerialization.jsonObject(with: (var_jsonData as Data)) as? [String: String] {
                        var_dictionary.removeAll()
                        var_dictionary.merge(var_jsonDict, uniquingKeysWith: {$1})
                    }
                } catch {}
            }
        }
    }
    
    func ht_getLangfilePathString(_ var_path:String) -> String? {
        var var_langPathStr = var_path
        let var_lastLangStr = UserDefaults.standard.string(forKey: "udf_lastLangPath") ?? ""
        var var_isDirectory: ObjCBool = false
        if FileManager.default.fileExists(atPath: var_langPathStr, isDirectory: &var_isDirectory) {
            UserDefaults.standard.set(var_langPathStr, forKey: "udf_lastLangPath")
        } else if FileManager.default.fileExists(atPath: var_lastLangStr, isDirectory: &var_isDirectory) {
            var_langPathStr = var_lastLangStr
        } else {
            var_langPathStr = ""
        }
        return var_langPathStr
    }
    
    func ht_getLangPathString() -> String {
        if let var_array = UserDefaults.standard.object(forKey: ht_AsciiString("AppleLanguages")) as? [String] {
            let var_string = var_array.first
            var var_lang = ht_AsciiString("en")
            if var var_langRegionArray = var_string?.components(separatedBy: "-") as? [String] {
                if var_langRegionArray.count >= 3 {
                    var_langRegionArray.removeLast()
                    var_lang = (var_langRegionArray as NSArray).componentsJoined(by: "_")
                } else if var_langRegionArray.count == 2 {
                    let var_last = var_langRegionArray.last ?? ""
                    let var_country = (Locale.current as NSLocale).countryCode ?? ""
                    if !var_country.isEmpty, var_country == var_last {
                        var_lang = var_langRegionArray.first ?? ""
                    } else {
                        var_lang = (var_langRegionArray as NSArray).componentsJoined(by: "_")
                    }
                } else if var_langRegionArray.count == 1 {
                    var_lang = var_langRegionArray.first ?? ""
                }
            }
            let var_name = "\(ht_AsciiString("Language/"))\(var_lang)\(ht_AsciiString(".txt"))"
            if let var_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
                return "\(var_path)/\(var_name)"
            }
        }
        return ""
    }
    
    func ht_judgeIfneedRequestLanguage() -> Bool {
        var var_result = false
        var var_isDirectory: ObjCBool = false
        if FileManager.default.fileExists(atPath: ht_getLangPathString(), isDirectory: &var_isDirectory) {
            let var_string = Bundle.main.infoDictionary![ht_AsciiString("CFBundleShortVersionString")] as? String
            let var_budnum = UserDefaults.standard.string(forKey: "udf_budnum") ?? ""
            if var_string != var_budnum {
                var_result = true
            }
        } else {
            var_result = true
        }
        return var_result
    }
    
    // 多语言
    func ht_stringWithKid(_ var_kid: Any) -> String {
        var var_string = ""
        if var_kid is String {
            var_string = var_kid as! String
        } else {
            var_string = "\(ht_AsciiString("string"))\(var_kid)"
        }
        if !var_dictionary.isEmpty, var_dictionary.contains(where: ({$0.key == var_string})) {
            return var_dictionary[var_string] ?? ""
        } else if !var_string.hasPrefix(ht_AsciiString("string")) {
            return var_string
        }
        return ht_AsciiString("text")
    }
}
