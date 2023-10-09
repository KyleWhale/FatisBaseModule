//
//  HTClassNetWordUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/14.
//

import UIKit
import Moya
import SwiftyJSON
import CoreTelephony
import AdSupport
import CommonCrypto

class HTClassNetWordUntil {
    
    fileprivate var var_requestPath: String = ""
    fileprivate var var_requestMethod: Moya.Method = .post
    fileprivate var var_parameters: [String: Any] = [:]
    fileprivate var var_image:UIImage?
    fileprivate let var_encoding = URLEncoding.default
    fileprivate var var_returnOrigin = false
    init() {
        
    }

    public func ht_request(method: Moya.Method = .post, url: Any, parameters: [String: Any] = [:], orgin:Bool = false, resultSuccess: @escaping (_ result: Bool, _ response: Any,_ error:HTClassModelReqError?) -> Void) {
        
        var var_urlString = "\(url)"
        if !var_urlString.hasPrefix("/") {
            var_urlString = "/" + var_urlString
        }
        
        if !var_urlString.hasSuffix("/") {
            var_urlString = var_urlString + "/"
        }
           self.var_requestPath = var_urlString
           self.var_returnOrigin = orgin
           self.var_requestMethod = method
           self.var_parameters = parameters
           let var_networkProvider = MoyaProvider<HTClassNetWordUntil>()
           var_networkProvider.request(self) { result in
               self.ht_resultData(result: result, resultSuccess: resultSuccess)
           }
       }
    
    public func ht_request(method: Moya.Method = .post, url: Any, parameters: [String: Any] = [:], image:UIImage?,resultSuccess: @escaping (_ result: Bool, _ response: Any,_ error:HTClassModelReqError?) -> Void) {
        var var_urlString = "\(url)"
        if !var_urlString.hasPrefix("/") {
            var_urlString = "/" + var_urlString
        }
        
        if !var_urlString.hasSuffix("/") {
            var_urlString = var_urlString + "/"
        }
           self.var_requestPath = var_urlString
           self.var_image = image
           self.var_requestMethod = method
           self.var_parameters = parameters
           let var_networkProvider = MoyaProvider<HTClassNetWordUntil>()
           var_networkProvider.request(self) { result in
               self.ht_resultData(result: result, resultSuccess: resultSuccess)
           }
       }

    fileprivate func ht_resultData(result: Result<Moya.Response, MoyaError>,resultSuccess: @escaping (_ result: Bool, _ response: Any, _ error:HTClassModelReqError?) -> Void) {
           if case .success(let response) = result {
               do {
                   let var_jsonData = try JSON(data: response.data)
                   if var_jsonData[ht_AsciiString("status")].intValue == 200{
                       if var_returnOrigin{
                           resultSuccess(true,var_jsonData.object,nil)
                       }else{
                           resultSuccess(true,var_jsonData[ht_AsciiString("data")].object,nil)
                       }
                   }else{
                       resultSuccess(false,response,HTClassModelReqError(var_code: var_jsonData[ht_AsciiString("status")].intValue, var_error: var_jsonData[ht_AsciiString("msg")].stringValue))
                   }
                } catch {
                    resultSuccess(false,response,HTClassModelReqError(var_code: 500, var_error: ht_AsciiString("Unknow Error")))
                }
           } else {
               resultSuccess(false,"",HTClassModelReqError(var_code: 500, var_error: ht_AsciiString("Unknow Error")))
           }
       }
}

extension HTClassNetWordUntil:TargetType{
    public var baseURL: URL{
        let var_string = (var_requestPath == "/\(87)/") ? STATIC_NETWORD : (UserDefaults.standard.string(forKey: "udf_api") ?? STATIC_NETWORD)
        return URL(string: var_string)!
    }

    public var path: String {
        return var_requestPath
    }

    public var method: Moya.Method {
        return var_requestMethod
    }

    public var task: Task {
        if let var_faceflag = var_parameters[ht_AsciiString("faceflag")] as? String, var_faceflag == "1",var_requestPath == "116",let var_image = var_image {
            var var_arr :[MultipartFormData] = []
            let var_formater = DateFormatter()
            var_formater.dateFormat = ht_AsciiString("yyyyMMddHHddss")
            let var_name = var_formater.string(from: Date())
            var_arr.append(MultipartFormData(provider: .data(var_image.ht_compressImage(var_maxLength: 100 * 1024)), name: ht_AsciiString("face"), fileName: "\(var_name).\(ht_AsciiString("jpg"))", mimeType: ht_AsciiString("image/jpeg")))
            let var_param = ht_mergeBaseParam(var_parameters)
            for (var_key,var_value) in var_param{
                if let var_str = var_value as? String {
                    let var_formData2 = MultipartFormData(provider: .data(var_str.data(using: String.Encoding.utf8)!), name: var_key)
                    var_arr.append(var_formData2)
                }
            }
            return .uploadMultipart(var_arr)
        }else{
            return .requestParameters(parameters: ht_mergeBaseParam(var_parameters), encoding: var_encoding)
        }
    }

    public var validate: Bool {
        return false
    }

    public var headers: [String: String]? {
        return [:]
    }
    
    func ht_md5(_ var_string: String) -> String {
        let var_messageData = var_string.data(using: String.Encoding.utf8)!
        var var_digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        var_digestData.withUnsafeMutableBytes { var_digestBytes in
            var_messageData.withUnsafeBytes({CC_MD5($0, CC_LONG(var_messageData.count), var_digestBytes)})
        }
        return var_digestData.map { String(format: "%02hhx", $0) }.joined()
    }
    
    func ht_mergeBaseParam(_ var_parameter: [String: Any]?) -> [String: Any] {
        var var_baseParams:[String:Any] = [:]
        
        let var_infoDictionary = Bundle.main.infoDictionary!
        
        if let var_parameter = var_parameter {
            if var_parameter[ht_AsciiString("uid")] == nil {
                var_baseParams[ht_AsciiString("uid")] = HTClassShare.default.var_userModel?.var_uid ?? "0"
            }
            let var_unixtime = var_parameter[ht_AsciiString("unixtime")] as? String ?? String(format: "%.0f", Date().timeIntervalSince1970)
            var_baseParams[ht_AsciiString("unixtime1")] = var_unixtime
            let var_saltStr = ht_AsciiString("drxsk93xd9ut")
            let var_bundleId = var_infoDictionary[ht_AsciiString("CFBundleIdentifier")] as? String ?? ""
            let var_device = UIDevice.current.identifierForVendor?.uuidString ?? ""
            let var_temp = String(format: "%@%@%@%@%@", var_device, "/", var_unixtime, "/", var_bundleId)
            let var_sign = String(format: "%@%@%@", ht_md5(var_temp), "/", var_saltStr)
            var_baseParams[ht_AsciiString("sig2")] = ht_md5(var_sign)
            
            let var_screen = UIScreen.main.bounds.size
            let var_scale = UIScreen.main.scale
            var var_mobileCountryCode: String?
            var var_mobileNetwork: String?
            let var_info = CTTelephonyNetworkInfo()
            if let var_cellularProviders = var_info.serviceSubscriberCellularProviders, var_cellularProviders.values.first != nil {
                let var_carrierProviders : CTCarrier = var_cellularProviders.values.first!
                if var_carrierProviders.mobileCountryCode != nil {
                    var_mobileCountryCode = var_carrierProviders.mobileCountryCode
                }
                if var_carrierProviders.mobileNetworkCode != nil {
                    var_mobileNetwork = var_carrierProviders.mobileNetworkCode
                }
            }
            
            var var_lang = ht_AsciiString("en")
            var var_country = ht_AsciiString("US")
            if let var_array = UserDefaults.standard.object(forKey: ht_AsciiString("AppleLanguages")) as? [String] {
                let var_string = var_array.first
                if var var_langRegionArray = var_string?.components(separatedBy: "-") as? [String] {
                    if var_langRegionArray.count >= 3 {
                        var_langRegionArray.removeLast()
                        var_lang = (var_langRegionArray as NSArray).componentsJoined(by: "_")
                        var_country = var_langRegionArray.last ?? ""
                    } else if var_langRegionArray.count == 2 {
                        let var_last = var_langRegionArray.last ?? ""
                        var_country = (Locale.current as NSLocale).countryCode ?? ""
                        if !var_country.isEmpty, var_country == var_last {
                            var_lang = var_langRegionArray.first ?? ""
                        } else {
                            var_lang = (var_langRegionArray as NSArray).componentsJoined(by: "_")
                        }
                    } else if var_langRegionArray.count == 1 {
                        var_lang = var_langRegionArray.first ?? ""
                        var_country = (Locale.current as NSLocale).countryCode ?? ""
                    }
                }
            }

            var_baseParams[ht_AsciiString("apns_id")] = HTClassShare.default.var_deviceToken ?? ""
            var_baseParams[ht_AsciiString("app_id")] = STATIC_APPID
            var_baseParams[ht_AsciiString("app_ver")] = var_infoDictionary["CFBundleShortVersionString"]
            var_baseParams[ht_AsciiString("brand")] = UIDevice.current.model
            var_baseParams[ht_AsciiString("country")] = var_country
            var_baseParams[ht_AsciiString("device")] = UIDevice.current.systemName
            var_baseParams[ht_AsciiString("deviceNo")] = UIDevice.current.identifierForVendor?.uuidString
            if ASIdentifierManager.shared().advertisingIdentifier.uuidString.hasPrefix(ht_AsciiString("00000000-0000")) {
                var_baseParams[ht_AsciiString("idfa")] = UIDevice.current.identifierForVendor?.uuidString
            } else {
                var_baseParams[ht_AsciiString("idfa")] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            }
            var_baseParams[ht_AsciiString("imsi")] = String(format: "%@%@", var_mobileCountryCode ?? "", var_mobileNetwork ?? "")
            if let var_time = UserDefaults.standard.object(forKey: String.STATIC_installtime) {
                var_baseParams[ht_AsciiString("installTime")] = String.init(format: "%.0f", var_time as! Double)
            }else{
                var_baseParams[ht_AsciiString("installTime")] = String.init(format: "%.0f", Date().timeIntervalSince1970)
            }
            var_baseParams[ht_AsciiString("lang")] = var_lang
            var_baseParams[ht_AsciiString("model")] = UIDevice.current.var_modelName
            var_baseParams[ht_AsciiString("os_ver")] = UIDevice.current.systemVersion
            var_baseParams[ht_AsciiString("r1")] = UserDefaults.standard.string(forKey: "udf_coverDefinition") ?? "0"
            var_baseParams[ht_AsciiString("reg_id")] = HTClassShare.default.var_fcmToken ?? "0"
            var_baseParams[ht_AsciiString("resolution")] = String.init(format: "%.0fx%.0f", var_screen.width * var_scale,var_screen.height * var_scale)
            var_baseParams[ht_AsciiString("simcard")] = var_mobileCountryCode == nil ? "0" : "1"
            let var_string = TimeZone.current.secondsFromGMT() / 3600;
            var_baseParams[ht_AsciiString("timezone")] = "\(var_string)"
            var_baseParams[ht_AsciiString("token")] = "1"
            var_baseParams[ht_AsciiString("vp")] = HTClassShare.default.ht_checkSub() ? "1" : "0"
            var_baseParams[ht_AsciiString("version")] = "6.0"
            var_baseParams.merge(var_parameter, uniquingKeysWith: {$1})
        }
        return var_baseParams
    }
}
