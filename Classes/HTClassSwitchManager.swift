//
//  HTClassSwitchManager.swift
//  ProjectSwift
//
//  Created by 李雪健 on 2023/8/25.
//

import Foundation
import UIKit

class HTClassSwitchManager {
    
    static func ht_switchStatus() -> Bool {
        let var_mtghjknm = UserDefaults.standard.integer(forKey: "udf_mtghjknm")
        let var_movuygiuda = UserDefaults.standard.integer(forKey: "udf_movuygiuda")
        let var_coverDefinition = UserDefaults.standard.integer(forKey: "udf_coverDefinition")
        let var_msword = UserDefaults.standard.bool(forKey: "udf_msword")
        var var_status = false
        if var_mtghjknm != 100 {
            var_status = false
        } else if var_movuygiuda == 0 || var_coverDefinition == 0 || !(var_coverDefinition == 100 || var_coverDefinition == 300 || var_movuygiuda == 400 || (var_coverDefinition == 200 && var_msword)) {
            var_status = false
        } else if var_movuygiuda == 100 || (var_movuygiuda == 400 && var_msword) || (var_coverDefinition == 200 && var_msword) || (var_coverDefinition == 400 && var_msword) {
            var_status = true
        }
        return var_status
    }
    
    static func ht_switchStatus7() -> Bool {
        let var_mtghjknm = UserDefaults.standard.integer(forKey: "udf_mtghjknm")
        let var_movuygiuda = UserDefaults.standard.integer(forKey: "udf_movuygiuda")
        let var_coverDefinition = UserDefaults.standard.integer(forKey: "udf_coverDefinition")
        let var_msword = UserDefaults.standard.bool(forKey: "udf_msword")
        var var_status = false
        if var_mtghjknm != 100 {
            var_status = false
        } else if var_movuygiuda == 0 || var_coverDefinition == 0 {
            var_status = false
        } else if (var_movuygiuda == 400 && var_msword) || (var_coverDefinition == 200 && var_msword) || (var_coverDefinition == 400 && var_msword) {
            var_status = true
        }
        return var_status
    }
    
    // 开关接口
    static func ht_switchRequest(var_status : Bool) {
        var var_parameter: [String:Any] = [:]
        var_parameter[ht_AsciiString("apk_name")] = Bundle.main.bundleIdentifier
        var var_network:String = "0"
        let var_cfDict = CFNetworkCopySystemProxySettings()
        if let var_cfDict = var_cfDict {
            let var_nsDict = var_cfDict.takeRetainedValue() as NSDictionary
            if let var_keys = var_nsDict[ht_AsciiString("__SCOPED__")] as? NSDictionary, let var_allKeys = var_keys.allKeys as? [String] {
                var_network = (var_allKeys as NSArray).componentsJoined(by: ",")
            }
        }
        var_parameter[ht_AsciiString("net")] = var_network
        var_parameter[ht_AsciiString("mheader")] = 7
        let var_kocava = UserDefaults.standard.string(forKey: .STATIC_kocava)
        let var_firebase = UserDefaults.standard.string(forKey: "udf_firebaseAttribution")
        if let var_kocava = var_kocava {
            var_parameter[ht_AsciiString("r2")] = var_kocava
        } else if let var_firebase = var_firebase {
            var_parameter[ht_AsciiString("r2")] = var_firebase
        } else {
            var_parameter[ht_AsciiString("r2")] = 0
        }
        
        HTClassNetWordUntil().ht_request(url: 87, parameters: var_parameter) { result, response, error in
            if result, let data = response as? [String: Any]  {
                let var_tab1 = data[ht_AsciiString("tab1")] as? [String: Any]
                let var_data = var_tab1?[ht_AsciiString("data")] as? [[String: Any]]
                let var_dataDict = var_data?.first
                UserDefaults.standard.set(var_dataDict?[ht_AsciiString("sword")], forKey: "udf_searchWord")
                UserDefaults.standard.set(var_dataDict?[ht_AsciiString("log")], forKey: "udf_login_h5")
                UserDefaults.standard.set(var_dataDict?[ht_AsciiString("img1")], forKey: "udf_imageDomain")
                UserDefaults.standard.set(var_dataDict?[ht_AsciiString("api1")], forKey: "udf_api")
                UserDefaults.standard.set(var_dataDict?[ht_AsciiString("dp")], forKey: "udf_dp")
                if let var_status = var_tab1?[ht_AsciiString("status")] as? Int, var_status == 200, !ht_switchStatus() {
                    if let var_resolution = var_dataDict?[ht_AsciiString("resolution")] {
                        var var_resolutionStr = "\(var_resolution)"
                        var_resolutionStr = "200" //测试
                        UserDefaults.standard.set(var_resolutionStr, forKey: "udf_coverDefinition")
                    }
                }
                if let var_tab9 = data[ht_AsciiString("tab9")] as? [String: Any] {
                    if let var_movuygiuda = var_tab9[ht_AsciiString("resolution")],
                       let var_mtghjknm = var_tab9[ht_AsciiString("resolution_tmp")] {
                        var var_movuygiudaStr = "\(var_movuygiuda)"
                        var var_mtghjknmStr = "\(var_mtghjknm)"
                        var_movuygiudaStr = "100" //测试
                        var_mtghjknmStr = "100" //测试
                        if !ht_switchStatus() {
                            UserDefaults.standard.set(var_movuygiudaStr, forKey: "udf_movuygiuda")
                        }
                        UserDefaults.standard.set(var_mtghjknmStr, forKey: "udf_mtghjknm")
                    }
                }
                // 埋点
                ht_switchMaidian(true, var_tab1?[ht_AsciiString("msg")] as? String ?? "")
            } else {
                // 埋点
                ht_switchMaidian()
            }
            if (!var_status) {
                //测试
//                AppDelegate.ht_localConfigurationInitialization()
            }
            HTClassMutilangManager.default.ht_requestLanguage()
        }
    }
    // 搜索777
    static func ht_search(_ var_text:String) {
        guard !var_text.isEmpty else {return}
        guard let var_searchword = UserDefaults.standard.string(forKey: "udf_searchWord") else {return}
        let var_movuygiuda = UserDefaults.standard.integer(forKey: "udf_movuygiuda")
        let var_coverDefinition = UserDefaults.standard.integer(forKey: "udf_coverDefinition")
        let var_msword = UserDefaults.standard.bool(forKey: "udf_msword")
        if (var_coverDefinition == 200 || var_coverDefinition == 400 || var_movuygiuda == 400) && !ht_switchStatus() && !var_msword && var_text.caseInsensitiveCompare(var_searchword) == .orderedSame {
            UserDefaults.standard.setValue(true, forKey: "udf_msword")
            UserDefaults.standard.setValue(true, forKey:.STATIC_white)
            UserDefaults.standard.setValue("2", forKey:.STATIC_op_type)
            HTClassMutilangManager.default.ht_requestLanguage()
        }
    }
    // 邀请码
    static func ht_invitation(_ var_text:String) {
        let var_search = UserDefaults.standard.string(forKey: "udf_searchWord") ?? ""
        if var_text.caseInsensitiveCompare(var_search) != .orderedSame {
            HTClassNetWordUntil().ht_request(url: 318,parameters: [ht_AsciiString("sig"):var_text]) {result, response, error in
                if result, let data = response as? [String: Any] {
                    if let var_resolution = data[ht_AsciiString("resolution")] {
                        var var_resolutionStr = "\(var_resolution)"
                        UserDefaults.standard.set(var_resolutionStr, forKey: "udf_coverDefinition")
                        UserDefaults.standard.set(var_resolutionStr, forKey: "udf_movuygiuda")
                        UserDefaults.standard.set(var_resolutionStr, forKey: "udf_mtghjknm")
                        if ht_switchStatus() {
                            UserDefaults.standard.setValue(true, forKey:.STATIC_white)
                            UserDefaults.standard.setValue("2", forKey:.STATIC_op_type)
                            HTClassMutilangManager.default.ht_requestLanguage()
                        }
                    }
                }
            }
        }
    }
    
    static func ht_updateRootWithChange(_ var_change:Bool) {
        
        if ht_switchStatus(), let var_vc = ht_window()?.rootViewController {
            //测试
//            if !(var_vc is HTClassBaseTabbarVC) || var_change {
//                UserDefaults.standard.setValue(true, forKey:.STATIC_white)
//                HTClassManage.ht_toMain()
//                AppDelegate.ht_localConfigurationInitialization()
//            }
        }
    }
    
    // 埋点
    static func ht_switchMaidian(_ var_success:Bool = false, _ var_msg:String = "") {
        var var_parameter: [String: Any] = [:]
        var var_status = "0"
        var var_result = "0"
        if var_success {
            if ht_switchStatus() {
                if ht_switchStatus7() {
                    var_status = "4"
                } else {
                    var_status = "1"
                }
            } else {
                var_status = "2"
            }
            var_result = var_msg
        } else {
            var_status = "3"
        }
        var_parameter[ht_AsciiString("status")] = var_status
        var_parameter[ht_AsciiString("source")] = 1
        var_parameter[ht_AsciiString("result")] = var_result
        HTClassPointRequestUntil().ht_request(var_point: ht_MaidianString("movie_switch"), var_parameters: var_parameter)
    }
}
