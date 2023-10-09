//
//  Common.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit
@_exported import AutoInch
@_exported import SnapKit
@_exported import Kingfisher
@_exported import Toast_Swift
@_exported import RZColorfulSwift
@_exported import Moya
@_exported import SwiftyJSON
@_exported import HandyJSON

public let var_ipad = (UIDevice.current.userInterfaceIdiom == .pad)
public let var_htHeight    = UIScreen.main.bounds.size.height
public let var_htWidth     = UIScreen.main.bounds.size.width
public let var_htStatusBarheight = UIApplication.shared.statusBarFrame.height
public func ht_iPhoneX() -> Bool {
    return UIWindow.var_key?.safeAreaInsets.bottom ?? 0 > 0.0
}
public func ht_window() -> UIWindow? {
    return UIWindow.var_key
}
public let var_htNaviHeight = var_htStatusBarheight + 44.0
public let var_htSafeBottom = ht_iPhoneX() ? 34.0 : 0
public let var_htTabbarHeight = var_htSafeBottom + 49.0
public let var_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)

public func ht_LocalString(_ var_string:Any) -> String{
    return HTClassMutilangManager.default.ht_stringWithKid(var_string)
}
public func ht_LocalInt(_ var_string:Any) -> String{
    return HTClassMutilangManager.default.ht_stringWithKid(var_string)
}

typealias BLOCK_selectBlock = (_ var_string : Any) ->()

/**
 * 测试
 */
public let STATIC_Time = 1
public let STATIC_NETWORD = "http://www.pluco.fun"
public let STATIC_APPID = 322
public let STATIC_AppleId = "6457258972"
public let STATIC_FacebookId = "1173346126669124"
public let STATIC_KOCHAVA =  "kopluco-322-edin5jfi1"
public let STATIC_MONTH =  "month"
public let STATIC_YEAR =  "year"
public let STATIC_WEEK =  "week"
public let STATIC_FREE =  "free_month"
public let STATIC_FAMILY_WEEK =  "family_week"
public let STATIC_FAMILY_YEAR =  "family_year"
public let STATIC_FAMILY_MONTH =  "family_month"
public let STATIC_PAY =  "736191bc28b94bccbec17fbc4cda6b88"

public let STATIC_TermsURL = "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/"
public let STATIC_PrivacyPolicyURL = "https://sites.google.com/view/pluco/privacypolicy"
public let STATIC_AppStore   = "https://buy.itunes.apple.com/verifyReceipt"
public let STATIC_SANDBOX    = "https://sandbox.itunes.apple.com/verifyReceipt"

public func ht_AsciiString(_ var_Data : Any) -> String {
    if (var_Data is NSArray)  {
        var var_NormalStr = "";
        for var_Code in var_Data as! NSArray {
            let var_CodeInt = var_Code as! Int - STATIC_APPID;
            let var_String:Character = Character(UnicodeScalar(var_CodeInt)!)
            var_NormalStr.append(var_String)
        }
        return var_NormalStr;
    }
    return var_Data as! String;
}

public func ht_MaidianString(_ var_Data : Any) -> String{
    if (var_Data is Int)  {
        return "\(var_Data)"
    }
    return var_Data as! String;
}
