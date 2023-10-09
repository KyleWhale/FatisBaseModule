//
//  HTClassManage.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseDynamicLinks

func ht_image(_ var_url:String) -> URL?{
    let var_string = UserDefaults.standard.string(forKey: "udf_imageDomain") ?? ""
    return URL(string: "\(var_string)\(var_url)@3x.png")
}

class HTClassManage: NSObject {
    static let sharedInstance = HTClassManage()
    
    typealias BLOCK_EventBlock = (_ var_object: Any)->Void
    typealias BLOCK_ShareBlock = (_ var_result: Bool)->Void
    typealias BLOCK_dynamicLinkBlock = (_ var_result: Bool)->Void

    static func ht_toPlay(var_model:HTClassModelMV?,var_source:String = "1"){
//        HTClassManage.ht_toPlay(var_model: var_model,var_source: var_source, var_item: nil)
    }
    static func ht_toPlay(var_model:HTClassModelMV?,var_source:String = "1",var_item:UIView?){
//        let var_vc = HTClassPlayVC()
//        var_vc.var_point_source = var_source
//        if let var_model = var_model{
//            let var_historyModel = HTClassShare.default.ht_checkHistory(var_id: var_model.var_id)
//            if let var_historyModel = var_historyModel{
//                var_model.var_stepMovieId = var_historyModel.var_stepMovieId
//                var_model.var_stepSessionId = var_historyModel.var_stepSessionId
//                var_model.var_stepCurrentTime = var_historyModel.var_stepCurrentTime
//                var_model.var_stepLanguage = var_historyModel.var_stepLanguage
//            }
//            var_vc.var_id = var_model.var_id
//            var_vc.var_model = var_model
//            if !var_model.var_m_type_2.isEmpty{
//                let var_myfx = ht_AsciiString("myfx")
//                var_vc.var_movieType =  (var_model.var_m_type_2 == var_myfx ? 0 : 1)
//            }else if !var_model.var_data_type.isEmpty{
//                var_vc.var_movieType =  (var_model.var_data_type == "3" ? 1 : 0)
//            }else if !var_model.var_mtype.isEmpty{
//                var_vc.var_movieType =  (var_model.var_mtype == "2" ? 1 : 0)
//            }
//            if var_model.var_stepCurrentTime > 0 ||  var_model.var_stepMovieId != nil {
//                var_vc.var_stepMovieId = var_model.var_stepMovieId
//                var_vc.var_stepSessionId = var_model.var_stepSessionId
//                var_vc.var_stepCurrent = var_model.var_stepCurrentTime
//                var_vc.var_stepLanguage = var_model.var_stepLanguage
//            }
//        }
//        var_vc.hidesBottomBarWhenPushed = true
//        HTClassManage.ht_getCurrentVC().navigationController?.pushViewController(var_vc, animated: true)
//        let var_current = ht_getCurrentVC()
//        if var_current is HTClassPlayVC,let var_navi = var_vc.navigationController {
//            var var_marr:[UIViewController] = var_navi.viewControllers
//            if !var_marr.isEmpty{
//                for (_,var_obj) in  var_marr.reversed().enumerated(){
//                    if var_obj is HTClassPlayVC && var_obj != var_vc{
//                        var_marr.removeAll { m in
//                            return m == var_obj
//                        }
//                    }
//                }
//                var_navi.viewControllers = var_marr
//            }
//        }
//        
//        if var_source == "1"{
//            var var_current_sename = ""
//            var var_current_id = ""
//            if let var_item = var_item{
//                var var_im:UIView = var_item
//                while !(var_im is HTClassTrendingCell){
//                    if let var_super = var_im.superview{
//                        var_im = var_super
//                    }else{
//                        break
//                    }
//                }
//                if var_im is HTClassTrendingCell{
//                    var_current_sename = (var_im as! HTClassTrendingCell).var_nameLB.text ?? ""
//                    var_current_id = (var_im as! HTClassTrendingCell).var_id
//                }
//            }
//            HTClassPointRequestUntil().ht_request(var_point: ht_MaidianString("home_m_cl_new"),var_parameters: [ht_AsciiString("kid"):"6",
//                                                                                              ht_AsciiString("secname"):var_current_sename,
//                                                                                              ht_AsciiString("secid"):var_current_id,
//                                                                                              ht_AsciiString("secdisplayname"):var_current_sename,
//                                                                                              ht_AsciiString("mtab_name"):HTClassShare.default.var_current_mtab_name,
//                                                                                              ht_AsciiString("c_id"):var_model?.var_id ?? "",
//                                                                                              ht_AsciiString("c_name"):var_model?.var_title ?? "",
//                                                                                              ht_AsciiString("ctype"):var_vc.var_movieType == 1 ? "2" : "1" ])
//        }
    }
    
    static func ht_payAction(var_product:String?,var_view:UIView = HTClassManage.ht_getCurrentVC().view){
//         guard let var_product = var_product else {return}
//         var_view.makeToastActivity(.center)
//         HTClassPayUntils.default.ht_payPurchase(var_id: var_product) { var_result in
//             if var_result {
//                 let var_receipt = HTClassPayUntils.default.ht_receipt()
//                 guard let var_receipt = var_receipt else {return}
//                 HTClassNetWordUntil().ht_request(url: 325,parameters: [
//                    ht_AsciiString("flag"):"1",
//                    ht_AsciiString("pid"):var_product,
//                    ht_AsciiString("receipt"):var_receipt
//                 ]) { result, response, error in
//                     if result {
//                         HTClassShare.default.ht_updateVipWithBlock(var_source: "3") { var_pay in
//                             DispatchQueue.main.async {
//                                 var_view.hideToastActivity()
//                             }
//                             if UserDefaults.standard.string(forKey: "udf_receiptString") == nil {
//                                 UserDefaults.standard.set(var_receipt, forKey: "udf_receiptString")
//                             }
//                             if let _ = var_pay {
//                                 if HTClassShare.default.ht_checkSub() {
//                                     DispatchQueue.main.async {
//                                         var_view.makeToast(ht_AsciiString("Pay Success!"))
//                                     }
//                                     if var_product == STATIC_FREE {
//                                         UserDefaults.standard.set("1", forKey: String.STATIC_free_month)
//                                     }
//                                     HTClassPayUntils.default.var_payID = var_product
//                                     UserDefaults.standard.set(var_product, forKey: String.STATIC_paid_product)
//                                     NotificationCenter.default.post(name: .var_notification.var_paySuccess, object: nil)
//                                 }else{
//                                     DispatchQueue.main.async {
//                                         var_view.makeToast(ht_AsciiString("Pay Fail!"))
//                                     }
//                                 }
//                             }else{
//                                 DispatchQueue.main.async {
//                                     var_view.makeToast(ht_AsciiString("Pay Fail!"))
//                                 }
//                             }
//                         }
//                     }else{
//                         DispatchQueue.main.async {
//                             var_view.hideToastActivity()
//                             var_view.makeToast(ht_AsciiString("Pay Fail!"))
//                         }
//                     }
//                 }
//             }else{
//                 DispatchQueue.main.async {
//                    var_view.hideToastActivity()
//                    var_view.makeToast(ht_AsciiString("Pay Fail!"))
//                 }
//             }
//         }
     }
    
    static func ht_checkInstallAlert(var_source:String = "1"){
        if UserDefaults.standard.object(forKey: String.STATIC_white) != nil{
            if let var_shareModel = HTClassShare.default.var_shareModel {
                if var_shareModel.var_gd_nstll!.var_status != 0 {
                    if (var_shareModel.var_gd_nstll!.var_k1 != 0) {
                        HTClassManage.ht_showGuideWithModelAndType(var_model: var_shareModel.var_gd_nstll!, var_type: 1)
                        UserDefaults.standard.setValue(false, forKey: "udf_k1Status")
                    } else {
                        let var_k1 = UserDefaults.standard.bool(forKey: "udf_k1Status")
                        if var_k1 != true {
                            HTClassManage.ht_showGuideWithModelAndType(var_model: var_shareModel.var_gd_nstll!, var_type: 1)
                            UserDefaults.standard.setValue(true, forKey: "udf_k1Status")
                        }
                    }
                } else if (var_shareModel.var_d2 != nil && var_shareModel.var_d2!.var_status != 0) {
                    if (var_shareModel.var_d2!.var_k1 != 0) {
                        HTClassManage.ht_showGuideWithModelAndType(var_model: var_shareModel.var_d2!, var_type: 2)
                        UserDefaults.standard.setValue(false, forKey: "udf_k1ToolStatus")
                    } else {
                        let var_k1 = UserDefaults.standard.bool(forKey: "udf_k1ToolStatus")
                        if var_k1 != true {
                            HTClassManage.ht_showGuideWithModelAndType(var_model: var_shareModel.var_d2!, var_type: 2)
                            UserDefaults.standard.setValue(true, forKey: "udf_k1ToolStatus")
                        }
                    }
                }
            }
        }
    }
    
    static func ht_showGuideWithModelAndType(var_model:HTClassModelGdNstll, var_type:Int) {
//        let var_view = HTClassInstallView()
//        var_view.var_model = var_model
//        var_view.var_type = var_type
//        ht_window()?.addSubview(var_view)
//        var_view.snp.remakeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        var_view.ht_show()
    }
    
    static func ht_openDeepURL(var_model:HTClassModelGdNstll,var_source:String = "1",var_confirm:BLOCK_dynamicLinkBlock?){
//        let var_dict : NSMutableDictionary = NSMutableDictionary(dictionary: HTClassDeepLinkManager.ht_public_params())
//        var_dict[ht_AsciiString("p1")] = HTClassShare.default.ht_requestTakePartInfoParams()[ht_AsciiString("p1")]
//        var_dict[ht_AsciiString("p2")] = HTClassShare.default.ht_requestTakePartInfoParams()[ht_AsciiString("p2")]
//        var_dict[ht_AsciiString("type")] = "2"
//        let var_jsonData = try? JSONSerialization.data(withJSONObject: var_dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
//        if let var_jsonData = var_jsonData,let var_JSONString = String(data: var_jsonData, encoding: String.Encoding.utf8) {
//            let var_params = ht_AsciiString("?params=")
//            let var_paramString = "\(var_model.var_l2)\(var_params)\(var_JSONString)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//            if let var_paramString = var_paramString {
//                let var_url = URL(string: var_paramString)
//                if let var_url = var_url {
//                    let var_linkBuilder = DynamicLinkComponents(link: var_url, domainURIPrefix: var_model.var_l1)
//                    if let var_linkBuilder = var_linkBuilder {
//                        var_linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: var_model.var_a1)
//                        var_linkBuilder.navigationInfoParameters = DynamicLinkNavigationInfoParameters.init()
//                        if (var_model.var_k2 == 1) {
//                            var_linkBuilder.navigationInfoParameters?.isForcedRedirectEnabled = true;
//                        } else {
//                            var_linkBuilder.navigationInfoParameters?.isForcedRedirectEnabled = false;
//                            var_linkBuilder.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters.init()
//                            var_linkBuilder.socialMetaTagParameters?.title = var_model.var_c4
//                            var_linkBuilder.socialMetaTagParameters?.descriptionText = var_model.var_c5
//                            if (var_model.var_logo.count > 0) {
//                                var_linkBuilder.socialMetaTagParameters?.imageURL = URL(string: var_model.var_logo)
//                            }
//                        }
//                        UIPasteboard.general.string = var_linkBuilder.url?.absoluteString
//                        var var_isPush : Bool = true;
//                        if (Bundle.main.bundleIdentifier == var_model.var_a1) {
//                            AppDelegate.ht_handleDynamicLink(var_info: var_linkBuilder.url!.absoluteString)
//                            var_isPush = false
//                            if let var_confirm = var_confirm {
//                                var_confirm(var_isPush)
//                            }
//                        }
//                        if (var_isPush && UIApplication.shared.canOpenURL(var_linkBuilder.url!)) {
//                            UIApplication.shared.open(var_linkBuilder.url!) { result in}
//                            if let var_confirm = var_confirm {
//                                var_confirm(var_isPush)
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
    static func ht_getVipName() -> String {
        var var_p2 = ""
        if let var_payModel = HTClassShare.default.var_payModel {
            if var_payModel.var_family?.var_val == "1" {
                var_p2 = var_payModel.var_family?.var_pid ?? ""
            } else if var_payModel.var_server?.var_val2 == "1" {
                var_p2 = var_payModel.var_server?.var_pid ?? ""
            } else if var_payModel.var_device?.var_val == "1" {
                var_p2 = var_payModel.var_device?.var_pid ?? ""
            } else if var_payModel.var_local?.var_value == "1" {
                var_p2 = HTClassPayUntils.default.var_payID ?? ""
            }
        }
        return var_p2
    }
        
    static func ht_cancelTime() -> String {
        var var_cancel = ""
        guard let var_payModel = HTClassShare.default.var_payModel else {return ""}
        if var_payModel.var_family?.var_val == "1", var_payModel.var_family?.var_auto_renew_status != "1" {
            var_cancel = var_payModel.var_family?.var_k6 ?? ""
        } else if var_payModel.var_server?.var_val2 == "1", var_payModel.var_server?.var_auto_renew_status != "1" {
            var_cancel = String(describing: var_payModel.var_server?.var_k6 ?? 0)
        } else if var_payModel.var_local?.var_value == "1", var_payModel.var_local?.var_auto_renew_status != "1" {
            var_cancel = String(describing: var_payModel.var_local?.var_k6 ?? 0)
        }
        return var_cancel
    }

    static func ht_toPay(var_source:String = "14"){
//        let var_vc = HTClassPremiumVC()
//        var_vc.var_force = true
//        var_vc.var_point_source = var_source
//        var_vc.hidesBottomBarWhenPushed = true
//        HTClassManage.ht_getCurrentVC().navigationController?.pushViewController(var_vc, animated: true)
    }
    
    static func ht_toMain(){
//        if UserDefaults.standard.object(forKey: .STATIC_white) == nil {
//            IQKeyboardManager.shared.enable = true
//            UIWindow.var_key?.rootViewController = HTClassRoundedTabBarController.var_tabBar
//        } else{
//            UIApplication.shared.statusBarStyle = .lightContent
//            if UserDefaults.standard.object(forKey: .STATIC_first) == nil {
//                UIWindow.var_key?.rootViewController = HTClassNaviVC(rootViewController: HTClassLaunchVC())
//            }else{
//                UIWindow.var_key?.rootViewController = HTClassBaseTabbarVC()
//                if HTClassShare.default.ht_checkSub() {
//                    HTClassPayUntils.default.var_payID = UserDefaults.standard.object(forKey: String.STATIC_paid_product) as? String
//                } else {
//                    if let var_sub = HTClassShare.default.var_subModel {
//                        // 拉到k12才会弹
//                        if var_sub.var_k3.count > 2 , let var_num = Int(var_sub.var_k3.first!) , var_num == 1 {
//                            let var_vc = HTClassActivityView()
//                            var_vc.tag = HTEnumWindowView.htEnumActivity.rawValue
//                            ht_window()?.addSubview(var_vc)
//                            var_vc.snp.remakeConstraints { make in
//                                make.edges.equalToSuperview()
//                            }
//                        } else {
//                            if var_sub.var_k12 == 1 {
//                                let var_vc = HTClassFakeCardController()
//                                var_vc.tag = HTEnumWindowView.htEnumBubBoot.rawValue
//                                ht_window()?.addSubview(var_vc)
//                                var_vc.ht_show()
//                                var_vc.snp.remakeConstraints { make in
//                                    make.edges.equalToSuperview()
//                                }
//                            } else {
//                                let var_vc = HTClassBubScripBootView()
//                                var_vc.tag = HTEnumWindowView.htEnumBubBoot.rawValue
//                                ht_window()?.addSubview(var_vc)
//                                var_vc.ht_show()
//                                var_vc.snp.remakeConstraints { make in
//                                    make.edges.equalToSuperview()
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
    
    ///登录
    static func ht_goLogin(){
//        if HTClassManage.ht_getCurrentVC() is HTClassWebLoginVC {
//            
//        }else{
//            let var_navi = HTClassNaviVC(rootViewController: HTClassWebLoginVC())
//            var_navi.modalPresentationStyle = .fullScreen
//            HTClassManage.ht_getCurrentVC().navigationController?.present(var_navi, animated: true)
//        }
    }
    ///协议
    static func ht_toWebUrl(var_key:String){
//        let var_vc = HTClassWebVC()
//        if var_key == ht_AsciiString("user") {
//            var_vc.var_url = STATIC_TermsURL
//            var_vc.title = ht_LocalString("Terms of Service")
//        }
//        else if var_key == ht_AsciiString("protocol") {
//            var_vc.var_url = STATIC_PrivacyPolicyURL
//            var_vc.title = ht_LocalString("Privacy Policy")
//        }
//        var_vc.ht_getNewData()
//        var_vc.hidesBottomBarWhenPushed = true
//        HTClassManage.ht_getCurrentVC().navigationController?.pushViewController(var_vc, animated: true)
    }

    
    static func ht_share(var_title:String?,var_url:String?,var_image:String?,var_block:BLOCK_ShareBlock?) -> UIActivityViewController{
        var var_marr:[Any] = []
        if let var_title = var_title {
            var_marr.append(var_title)
        }
        if let var_url = var_url {
            var_marr.append(URL(string: var_url) as Any)
        }
        if let var_image = var_image {
            var_marr.append(UIImage(named: var_image) as Any)
        }
        let var_vc =  UIWindow.var_key?.rootViewController
        let var_activityVC = UIActivityViewController(activityItems: var_marr, applicationActivities: nil)
        if var_IPAD {
            var_activityVC.popoverPresentationController?.sourceView = var_vc?.view
            var_activityVC.popoverPresentationController?.sourceRect = CGRectMake(15, (var_vc?.view.frame.size.height)!/2.0, 1.0, 1.0);
            var_activityVC.popoverPresentationController?.permittedArrowDirections = .any;
        }
        var_vc?.present(var_activityVC, animated: true)

        var_activityVC.completionHandler = {type,completed in
            if let var_block = var_block{
                var_block(completed)
            }
        }
        return var_activityVC
    }
    static func ht_alert(var_message:String?){
//        HTClassManage.ht_alert(var_title: nil, var_message: var_message, var_cancelTitle: nil, var_confirm: nil, var_cancel: nil)
    }
    
    static func ht_alert(var_title:String?,var_message:String?,var_cancelTitle:String?,var_sureTitle:String = ht_LocalString("OK"),var_confirm:BLOCK_EventBlock?,var_cancel:BLOCK_EventBlock?){
//        let var_alert = UIAlertController(title: var_title, message: var_message, preferredStyle: .alert)
//        var_alert.overrideUserInterfaceStyle = .dark
//        if let var_cancelTitle = var_cancelTitle {
//            let var_btn2 = UIAlertAction(title: var_cancelTitle, style: .cancel) { action in
//                if let var_cancel = var_cancel {
//                    var_cancel(action)
//                }
//            }
//            var_alert.addAction(var_btn2)
//        }
//        
//        let var_btn1  = UIAlertAction(title: var_sureTitle, style: .default) { action in
//            if let var_confirm = var_confirm {
//                var_confirm(action)
//            }
//        }
//        var_alert.addAction(var_btn1)
//        
//        if var_sureTitle == ht_AsciiString("Logout") {
//            var_btn1.setValue(UIColor.ht_colorHex(var_rgbValue: 0xF4473C), forKey: ht_AsciiString("_titleTextColor"))
//        }else{
//            var_btn1.setValue(UIColor.ht_colorHex(var_rgbValue: 0x3CDEF4), forKey: ht_AsciiString("_titleTextColor"))
//        }
//        HTClassManage.ht_getCurrentVC().present(var_alert, animated: true)
    }
    
    static public func ht_getCurrentVC() -> UIViewController {
        var var_topViewController = ht_window()?.rootViewController
        while true {
            if var_topViewController?.presentedViewController != nil {
                var_topViewController = var_topViewController?.presentedViewController
            }
            else if (var_topViewController as? UINavigationController)?.topViewController != nil{
                var_topViewController = (var_topViewController as? UINavigationController)?.topViewController
            }
            else if var_topViewController as? UITabBarController != nil{
                var_topViewController = (var_topViewController as? UITabBarController)?.selectedViewController
            }
            else {
                break
            }
        }
        return var_topViewController!
    }

}
