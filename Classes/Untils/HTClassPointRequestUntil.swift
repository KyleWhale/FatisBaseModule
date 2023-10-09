//
//  HTClassPointUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/16.
//

import Foundation
import Moya
import SwiftyJSON
import CoreTelephony
import AdSupport

class HTClassPointRequestUntil {
    
    fileprivate var var_requestPath: String = ""
    fileprivate var var_parameters: [String: Any] = [:]
    init() {
        
    }

    public func ht_request(var_point:String,var_parameters: [String: Any] = [:]) {
        var var_baseParams:[String:Any] = [:]
        var_baseParams.merge(var_parameters, uniquingKeysWith: {$1})
        var_baseParams[ht_AsciiString("pointname")] = var_point
        print("🐴\(var_baseParams)")
        self.var_parameters = var_baseParams
        let var_networkProvider = MoyaProvider<HTClassPointRequestUntil>()
        var_networkProvider.request(self) { result in
            if case .success(let response) = result {
                print(response.data)
            } else {

            }
        }
    }
}

extension HTClassPointRequestUntil:TargetType{
    public var baseURL: URL{
        let var_string = UserDefaults.standard.string(forKey: "udf_dp") ?? STATIC_NETWORD
        return URL(string: var_string)!
    }

    public var path: String {
        return ht_AsciiString("/data/")
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        return .requestParameters(parameters: ht_mergeBaseParam(var_parameters), encoding: URLEncoding.default)
    }

    public var validate: Bool {
        return false
    }

    public var headers: [String: String]? {
        return [:]
    }
    
    private func ht_mergeBaseParam(_ var_parameter: [String: Any]?) -> [String: Any] {
        var var_baseParams:[String:Any] = [:]
        if let var_parameter = var_parameter {
            let var_infoDictionary = Bundle.main.infoDictionary!
            var var_network = ""
            let var_cfDict = CFNetworkCopySystemProxySettings()
            if let var_cfDict = var_cfDict {
                let var_nsDict = var_cfDict.takeRetainedValue() as NSDictionary
                if let var_keys = var_nsDict[ht_AsciiString("__SCOPED__")] as? NSDictionary, let var_allKeys = var_keys.allKeys as? [String] {
                    var_network = (var_allKeys as NSArray).componentsJoined(by: ",")
                }
            }
            let var_screen = UIScreen.main.bounds.size
            let var_scale = UIScreen.main.scale
            var var_mobileCountryCode: String?
            let var_info = CTTelephonyNetworkInfo()
            if let var_carrierProviders = var_info.serviceSubscriberCellularProviders {
                for var_item in var_carrierProviders.values {
                    if var_item.mobileCountryCode != nil {
                        var_mobileCountryCode = var_item.mobileCountryCode
                    }
                }
            }
            var_baseParams[ht_AsciiString("app_id")] = STATIC_APPID
            var_baseParams[ht_AsciiString("apilevel")] = ""
            var_baseParams[ht_AsciiString("apns_id")] =  HTClassShare.default.var_deviceToken ?? ""
            var_baseParams[ht_AsciiString("brand")] = UIDevice.current.model
            var_baseParams[ht_AsciiString("channel2")] = ""
            if let var_array = UserDefaults.standard.object(forKey: ht_AsciiString("AppleLanguages")) as? [String] {
                let var_string = var_array.first
                var_baseParams[ht_AsciiString("cl")] = var_string ?? ""
            }
            var_baseParams[ht_AsciiString("data")] = var_network
            var_baseParams[ht_AsciiString("display")] = String.init(format: "%.0fx%.0f", var_screen.width * var_scale,var_screen.height * var_scale)
            if ASIdentifierManager.shared().advertisingIdentifier.uuidString.hasPrefix(ht_AsciiString("00000000-0000")) {
                var_baseParams[ht_AsciiString("idfa")] = UIDevice.current.identifierForVendor?.uuidString
            } else {
                var_baseParams[ht_AsciiString("idfa")] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            }
            if let var_time = UserDefaults.standard.object(forKey: String.STATIC_installtime) {
                var_baseParams[ht_AsciiString("install_len")] = String.init(format: "%.0f", var_time as! Double)
            } else {
                var_baseParams[ht_AsciiString("install_len")] = String.init(format: "%.0f", Date().timeIntervalSince1970)
            }
            var_baseParams[ht_AsciiString("login")] = HTClassShare.default.ht_checkLogin() ? "1" : "0"
            var_baseParams[ht_AsciiString("loginstatus")] = "0"
            var_baseParams[ht_AsciiString("mcc")] = "0"
            var_baseParams[ht_AsciiString("model")] = UIDevice.current.var_modelName
            var_baseParams[ht_AsciiString("musiccountry")] = HTClassShare.default.var_shareModel?.var_region_tag ?? "0"
            var_baseParams[ht_AsciiString("os_ver")] = UIDevice.current.systemVersion
            var_baseParams[ht_AsciiString("prodid")] = "2"
            var_baseParams[ht_AsciiString("reg_id")] = HTClassShare.default.var_fcmToken ?? ""
            var_baseParams[ht_AsciiString("simcard")] = var_mobileCountryCode == nil ? "0" : "1"
            
            let var_string = TimeZone.current.secondsFromGMT() / 3600;
            var_baseParams[ht_AsciiString("timezone")] = "\(var_string)"
            var_baseParams[ht_AsciiString("uptime")] = String.init(format: "%.0f", Date().timeIntervalSince1970)
            var_baseParams[ht_AsciiString("userid")] = HTClassShare.default.var_userModel?.var_uid ?? "0"
            var_baseParams[ht_AsciiString("ver")] = var_infoDictionary["CFBundleShortVersionString"]
            var_baseParams[ht_AsciiString("vercode")] = ""
            var_baseParams[ht_AsciiString("vp")] = HTClassShare.default.ht_checkSub() ? "1" : "0"
            var_baseParams[ht_AsciiString("xaid")] = UIDevice.current.identifierForVendor?.uuidString ?? ""
            var_baseParams.merge(var_parameter, uniquingKeysWith: {$1})
        }
        return var_baseParams
    }
}
