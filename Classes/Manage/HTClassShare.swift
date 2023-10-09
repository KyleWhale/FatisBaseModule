//
//  HTClassShare.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

import UIKit
import HandyJSON
import StoreKit

typealias BLOCK_shareUserBlock = (_ var_user: HTClassModelUser?)->Void
typealias BLOCK_sharePayBlock = (_ var_pay: HTClassModelPay?)->Void
class HTClassShare {
    var var_lock = false
    var var_shouldShowPushAlert = false
    private init() {
        ht_congig()
    }
    static let `default` = HTClassShare()
    var var_current_mtab_name = ""
    var var_loginUserModel:HTClassModelUserLogin?
    var var_userModel:HTClassModelUser?
    var var_deviceToken:String?
    var var_fcmToken:String?
    var var_subModel:HTClassModelSubscribe?
    var var_shareModel:HTClassModelShare?
    var var_configModel:HTClassModelConfig?
    var var_payModel:HTClassModelPay?
    var var_monthProduct:SKProduct?
    var var_yearProduct:SKProduct?
    var var_weekProduct:SKProduct?
    var var_freeProduct:SKProduct?
    
    var var_familyMonthProduct:SKProduct?
    var var_familyYearProduct:SKProduct?
    var var_familyWeekProduct:SKProduct?
    
    var var_searchType = "1"
    var var_home_point_param:[String:Any] = [:]
    
    func ht_congig(){
        var var_userJsonStr = UserDefaults.standard.object(forKey: String.STATIC_user) as? String
        if let var_userJsonStr = var_userJsonStr{
            self.var_userModel = HTClassModelUser.deserialize(from: var_userJsonStr)
        }
        
        var_userJsonStr = UserDefaults.standard.object(forKey: String.STATIC_config) as? String
        if let var_userJsonStr = var_userJsonStr{
            self.var_configModel = HTClassModelConfig.deserialize(from: var_userJsonStr)
        }
        
        var_userJsonStr = UserDefaults.standard.object(forKey: String.STATIC_share) as? String
        if let var_userJsonStr = var_userJsonStr{
            self.var_shareModel = HTClassModelShare.deserialize(from: var_userJsonStr)
        }
        
        var_userJsonStr = UserDefaults.standard.object(forKey: String.STATIC_subscribe) as? String
        if let var_userJsonStr = var_userJsonStr{
            self.var_subModel = HTClassModelSubscribe.deserialize(from: var_userJsonStr)
        }
        
        var_userJsonStr = UserDefaults.standard.object(forKey: String.STATIC_payModel) as? String
        if let var_userJsonStr = var_userJsonStr{
            self.var_payModel = HTClassModelPay.deserialize(from: var_userJsonStr)
        }
        
        var_userJsonStr = UserDefaults.standard.object(forKey: String.STATIC_loginuser) as? String
        if let var_userJsonStr = var_userJsonStr{
            self.var_loginUserModel = HTClassModelUserLogin.deserialize(from: var_userJsonStr)
        }
    }
    
    func ht_setModel(var_user:HTClassModelHandJson?,var_key:String){
        if let var_user = var_user{
            UserDefaults.standard.setValue(var_user.toJSONString(), forKey: var_key)
        }else{
            UserDefaults.standard.removeObject(forKey: var_key)
        }
    }
    
    func ht_checkSub() -> Bool {
        guard let var_payModel = var_payModel else {return false}
        if var_payModel.var_local?.var_value == "1" || var_payModel.var_server?.var_val2 == "1" || var_payModel.var_device?.var_val == "1" || var_payModel.var_family?.var_val == "1" {
            return true
        }
        return false
    }
    
    
    func ht_checkLogin(var_push:Bool = false) -> Bool {
        var var_result = false
        if let var_userModel = var_userModel,!var_userModel.var_uid.isEmpty{
            var_result = true
        }
        if !var_result && var_push{
            HTClassManage.ht_goLogin()
        }
        return var_result
    }

    
    func ht_getUserInfoWithUid(var_uid:String,var_block:BLOCK_shareUserBlock?){
        HTClassNetWordUntil().ht_request(url: 115,parameters: [ht_AsciiString("uid"):var_uid]) {result, response, error in
            if result {
                let var_model:HTClassModelUser? = HTClassModelUser.deserialize(from: response as? Dictionary<String, Any>)
                if let var_block = var_block{
                    var_block(var_model)
                }
            }else{
                if let var_block = var_block{
                    var_block(nil)
                }
            }
        }
    }
    
    func ht_subscribe_maidian(_ var_source:String) {
        
        guard let var_payModel = var_payModel else {return}
        var var_k7 = "0"
        if var_payModel.var_family?.var_val == "1" {
            var_k7 = var_payModel.var_family?.var_k7 ?? "0"
        } else if var_payModel.var_server?.var_val2 == "1" {
            var_k7 = var_payModel.var_server?.var_k7 ?? "0"
        } else if var_payModel.var_local?.var_value == "1" {
            var_k7 = var_payModel.var_local?.var_k7 ?? "0"
        }
        var var_parameters: [String: Any] = [:]
        var_parameters[ht_AsciiString("source")] = var_source
        var_parameters[ht_MaidianString("pay_time")] = var_k7
        var_parameters[ht_MaidianString("ctype")] = "1"
        if !ht_checkSub() {
            var_parameters[ht_AsciiString("status")] = "2"
            var_parameters[ht_AsciiString("status2")] = "2"
            var_parameters[ht_AsciiString("s_x_status")] = "2"
            var_parameters[ht_MaidianString("g_status")] = "1"
            var_parameters[ht_MaidianString("s_s_status")] = "1"
            var_parameters[ht_MaidianString("s_f_status")] = "1"
        } else {
            let var_localVip = var_payModel.var_local?.var_value == "1"
            let var_deviceVip = var_payModel.var_device?.var_val == "1"
            let var_serverVip = var_payModel.var_server?.var_val2 == "1"
            let var_familyVip = var_payModel.var_family?.var_val == "1"
            let var_toolVip = var_payModel.var_server?.var_t1 == "2"
            if var_deviceVip {
                var_parameters[ht_AsciiString("type3")] = var_payModel.var_device?.var_pid ?? ""
                var_parameters[ht_AsciiString("s_x_status")] = "1"
            } else {
                var_parameters[ht_AsciiString("s_x_status")] = "2"
            }
            if ht_checkLogin() {
                var_parameters[ht_AsciiString("mail")] = var_userModel?.var_email ?? ""
                if var_familyVip {
                    var_parameters[ht_MaidianString("type2")] = var_payModel.var_family?.var_pid ?? ""
                    var_parameters[ht_AsciiString("status")] = (var_payModel.var_family?.var_auto_renew_status == "1") ? "1" : "3"
                    var_parameters[ht_MaidianString("s_f_status")] = var_toolVip ? "3" : "1"
                    var_parameters[ht_MaidianString("s_f_master")] = var_payModel.var_family?.var_master ?? ""
                    var_parameters[ht_MaidianString("s_s_status")] = ""
                    var_parameters[ht_AsciiString("fid")] = var_payModel.var_family?.var_fid ?? ""
                } else if var_serverVip {
                    var_parameters[ht_MaidianString("type2")] = var_payModel.var_server?.var_pid ?? ""
                    var_parameters[ht_AsciiString("status")] = (var_payModel.var_server?.var_auto_renew_status == "1") ? "1" : "3"
                    var_parameters[ht_MaidianString("s_s_status")] = var_toolVip ? "3" : "1"
                    var_parameters[ht_MaidianString("s_f_master")] = ""
                    var_parameters[ht_MaidianString("s_f_status")] = ""
                    var_parameters[ht_AsciiString("fid")] = ""
                }
            }
            if var_localVip {
                if var_payModel.var_local?.var_auto_renew_status == "1" {
                    var_parameters[ht_AsciiString("status")] = "1"
                    var_parameters[ht_AsciiString("status2")] = "1"
                } else {
                    var_parameters[ht_AsciiString("status")] = "3"
                    var_parameters[ht_AsciiString("status2")] = "3"
                }
                var_parameters[ht_MaidianString("g_status")] = "1"
                var_parameters[ht_AsciiString("type")] = HTClassPayUntils.default.var_payID
            }
        }
        HTClassPointRequestUntil().ht_request(var_point: ht_MaidianString("subscribe_status"),var_parameters: var_parameters)
    }
    
    func ht_updateVipWithBlock(var_source:String = "4",var_block:BLOCK_sharePayBlock?) {
        
        let var_receipt = HTClassPayUntils.default.ht_receipt() ?? ""
        HTClassNetWordUntil().ht_request(url: 326,parameters: [
            ht_AsciiString("flag") : 0,
            ht_AsciiString("pid") : HTClassPayUntils.default.var_payID ?? "",
            ht_AsciiString("fid") : HTClassShare.default.var_userModel?.var_fid ?? "",
            ht_AsciiString("receipt") : var_receipt
        ]) {[weak self] result, response, error in
            guard let this = self else {return}
            if result {
                let var_model:HTClassModelPay? = HTClassModelPay.deserialize(from: response as? Dictionary<String, Any>)
                if let var_model = var_model {
                    if this.ht_checkLogin() {
                        this.var_loginUserModel!.var_fid = var_model.var_family?.var_fid ?? ""
                    }
                    if var_model.var_device?.var_f1 == "1" {
                        this.ht_addFamilyAlert()
                    }
                    this.var_payModel = var_model
                    HTClassShare.default.ht_setModel(var_user: var_model, var_key: String.STATIC_payModel)
                    HTClassPayUntils.default.var_payID = var_model.var_local?.var_pid ?? ""
                    UserDefaults.standard.set(var_model.var_local?.var_pid ?? "", forKey: String.STATIC_paid_product)
                }
                if let var_block = var_block{
                    var_block(var_model)
                }
                // 检测是否强制登录
                this.ht_checkForceLogin()
                // 埋点
                this.ht_subscribe_maidian(var_source)
            } else {
                if let var_block = var_block{
                    var_block(nil)
                }
            }
            NotificationCenter.default.post(name: .var_notification.var_verifyCompletion, object: nil)
        }
    }
    
    // 强制登录
    func ht_checkForceLogin() {
        if ht_checkLogin() {
            return
        }
        if let var_localVip = HTClassShare.default.var_payModel?.var_local?.var_value, var_localVip == "1" {
            return
        }
        if let var_deviceVip = HTClassShare.default.var_payModel?.var_device?.var_val, var_deviceVip == "0" {
            return
        }
        //测试
//        if HTClassWebLoginVC.var_into {
//            return
//        }
//        let var_vc = HTClassWebLoginVC()
//        var_vc.var_source = "37";
//        if let var_k13 = var_subModel?.var_k13 {
//            var_vc.var_force = var_k13 > 0 ? "1" : "2"
//        }
//        var_vc.modalPresentationStyle = .overFullScreen
//        HTClassManage.ht_getCurrentVC().present(var_vc, animated: true)
    }
    
    func ht_addFamilyAlert() {
        // 只提示一次
        let var_show = UserDefaults.standard.bool(forKey: "udf_remindAddFamilyMember")
        guard !var_show else {return}
        UserDefaults.standard.set(true, forKey: "udf_remindAddFamilyMember")
        //测试
//        let view = HTClassFamilyGuidAddView()
//        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
//            keyWindow.addSubview(view)
//            view.snp.remakeConstraints { make in
//                make.edges.equalTo(0)
//            }
//            view.BLOCK_clinkedBlock = { index in
//                if index == 1 {
//                    let var_vc = HTClassFamilyMainController()
//                    var_vc.hidesBottomBarWhenPushed = true
//                    HTClassManage.ht_getCurrentVC().navigationController?.pushViewController(var_vc, animated: true)
//                }
//            }
//        }
    }

    func ht_deleteAllSearch(){
        let var_key = String(format: "%@_%@",String.STATIC_searchhistory,ht_AsciiString("data"))
        UserDefaults.standard.removeObject(forKey: var_key)
    }
    
    func ht_saveSearchModel(var_model:HTClassModelBase?){
        guard let var_model = var_model , let var_title =  var_model.var_title,!var_title.isEmpty else { return }
        let var_key = String(format: "%@_%@",String.STATIC_searchhistory,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        var var_marr:[HTClassModelBase] = []
        if let var_jsonStr = var_jsonStr {
            if let var_arr = [HTClassModelBase].deserialize(from: var_jsonStr) {
                var_arr.forEach { m in
                    if let m = m {
                        var_marr.append(m)
                    }
                }
                var var_index = -1
                for (var_i,var_mo) in var_arr.enumerated(){
                    if let var_mo = var_mo{
                        if var_mo.var_title == var_model.var_title {
                            var_index = var_i
                            break
                        }
                    }
                }
                if var_index != -1{
                    var_marr.remove(at: var_index)
                }
                var_marr.insert(var_model, at: 0)
            }else{
                var_marr.append(var_model)
            }
        }else{
            var_marr.append(var_model)
        }
        UserDefaults.standard.set(var_marr.toJSONString(), forKey: var_key)
    }
    
    func ht_getSearchDatasource()->[HTClassModelBase]{
        let var_key = String(format: "%@_%@",String.STATIC_searchhistory,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        var var_arr:[HTClassModelBase] = []
        if let var_arrr = [HTClassModelBase].deserialize(from: var_jsonStr) {
            var_arrr.forEach { m in
                if let var_m = m {
                    var_arr.append(var_m)
                }
            }
        }
        return var_arr
    }
    
    func ht_checkCollect(var_id:String) -> HTClassModelMV?{
        var var_resultModel:HTClassModelMV?
        let var_key = String(format: "%@_%@",String.STATIC_collect,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        if let var_arrr = [HTClassModelMV].deserialize(from: var_jsonStr) {
            for var_m in var_arrr{
                if let var_m = var_m, var_m.var_id == var_id {
                    var_resultModel = var_m
                    break
                }
            }
        }
        return var_resultModel
    }
    
    func ht_updateCollect(var_model:HTClassModelMV?){
        guard let var_model = var_model else {return}
        if ht_checkCollect(var_id: var_model.var_id) == nil {
            return
        }
        let var_key = String(format: "%@_%@",String.STATIC_collect,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        if let var_arrr = [HTClassModelMV].deserialize(from: var_jsonStr) {
            var var_arr:[HTClassModelMV] = []
            for var_m in var_arrr{
                if let var_m = var_m {
                    if var_m.var_id == var_model.var_id{
                        var_arr.append(var_model)
                    }else{
                        var_arr.append(var_m)
                    }
                }
            }
            UserDefaults.standard.set(var_arr.toJSONString(), forKey: var_key)
        }
    }
    
    func ht_saveCollectModel(var_model:HTClassModelMV?,var_del:Bool = false) -> Bool{
        guard let var_model = var_model else {return false}
        let var_key = String(format: "%@_%@",String.STATIC_collect,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        let var_saveModel = HTClassModelMV()
        var_saveModel.var_id = var_model.var_id
        var_saveModel.var_title = var_model.var_title
        var_saveModel.var_rate = var_model.var_rate
        var_saveModel.var_step = var_model.var_step
        var_saveModel.var_shouldOpen = var_model.var_shouldOpen
        var_saveModel.var_stepCurrentTime = var_model.var_stepCurrentTime
        var_saveModel.var_stepSessionId = var_model.var_stepSessionId
        var_saveModel.var_stepLanguage = var_model.var_stepLanguage
        var_saveModel.var_stepMovieId = var_model.var_stepMovieId
        if !var_model.var_m_type_2.isEmpty{
            var_saveModel.var_m_type_2 = var_model.var_m_type_2
        }
        var_saveModel.var_ne_flag = var_model.var_ne_flag
        var_saveModel.var_cover = var_model.var_cover
        var_saveModel.var_stars = var_model.var_stars
        var_saveModel.var_description = var_model.var_description
        var_saveModel.var_pub_date = var_model.var_pub_date
        var_saveModel.var_quality = var_model.var_quality
        var_saveModel.var_ss_eps = var_model.var_ss_eps
        var_saveModel.var_tags = var_model.var_tags
        var var_arr:[HTClassModelMV] = []
        if let jsonStr = var_jsonStr {
            if let arr = [HTClassModelMV].deserialize(from: jsonStr) {
                if !arr.isEmpty {
                    for var_m in arr{
                        if let var_m = var_m {
                            var_arr.append(var_m)
                        }
                    }
                    var var_index = -1
                    for (var_i,var_m) in var_arr.enumerated(){
                        if var_m.var_id == var_saveModel.var_id {
                            var_index = var_i
                            break
                        }
                    }
                    if var_del {
                        if var_index != -1 {
                            var_arr.remove(at: var_index)
                        }else{
                            var_arr.insert(var_saveModel, at: 0)
                        }
                    }else{
                        if var_index != -1 {
                            var_arr.remove(at: var_index)
                        }
                        var_arr.insert(var_saveModel, at: 0)
                    }
                }else{
                    var_arr.append(var_saveModel)
                }
            }
        }else{
            var_arr.append(var_saveModel)
        }
        UserDefaults.standard.set(var_arr.toJSONString(), forKey: var_key)
        return true
    }
    
    func ht_getCollectDatasource()->[HTClassModelMV]{
        let var_key = String(format: "%@_%@",String.STATIC_collect,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        var var_arr:[HTClassModelMV] = []
        if let var_arrr = [HTClassModelMV].deserialize(from: var_jsonStr) {
            var_arrr.forEach { m in
                if let var_m = m {
                    var_arr.append(var_m)
                }
            }
        }
        return var_arr
    }
    
    func ht_checkHistory(var_id:String) -> HTClassModelMV?{
        var var_resultModel:HTClassModelMV?
        let var_key = String(format: "%@_%@",String.STATIC_history,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        if let var_arr = [HTClassModelMV].deserialize(from: var_jsonStr) {
            for var_m in var_arr{
                if let var_m = var_m, var_m.var_id == var_id {
                    var_resultModel = var_m
                    break
                }
            }
        }
        return var_resultModel
    }
    
    func ht_saveHistoryModel(var_model:HTClassModelMV?,var_del:Bool = false) -> Bool{
        guard let var_model = var_model else {return false}
        let var_key = String(format: "%@_%@",String.STATIC_history,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        let var_saveModel = HTClassModelMV()
        var_saveModel.var_id = var_model.var_id
        var_saveModel.var_title = var_model.var_title
        var_saveModel.var_rate = var_model.var_rate
        var_saveModel.var_step = var_model.var_step
        var_saveModel.var_shouldOpen = var_model.var_shouldOpen
        var_saveModel.var_stepCurrentTime = var_model.var_stepCurrentTime
        var_saveModel.var_stepSessionId = var_model.var_stepSessionId
        var_saveModel.var_stepLanguage = var_model.var_stepLanguage
        var_saveModel.var_stepMovieId = var_model.var_stepMovieId
        if !var_model.var_m_type_2.isEmpty{
            var_saveModel.var_m_type_2 = var_model.var_m_type_2
        }
        var_saveModel.var_cover = var_model.var_cover
        var_saveModel.var_stars = var_model.var_stars
        var_saveModel.var_description = var_model.var_description
        var_saveModel.var_pub_date = var_model.var_pub_date
        var_saveModel.var_quality = var_model.var_quality
        var_saveModel.var_ss_eps = var_model.var_ss_eps
        var_saveModel.var_ne_flag = var_model.var_ne_flag
        var_saveModel.var_tags = var_model.var_tags
        var var_arr:[HTClassModelMV] = []
        if let var_jsonStr = var_jsonStr {
            if let arr = [HTClassModelMV].deserialize(from: var_jsonStr) {
                if !arr.isEmpty {
                    for var_m in arr{
                        if let var_m = var_m {
                            var_arr.append(var_m)
                        }
                    }
                    var var_index = -1
                    for (var_i,var_m) in var_arr.enumerated(){
                        if var_m.var_id == var_saveModel.var_id {
                            var_index = var_i
                            break
                        }
                    }
                    if var_del {
                        if var_index != -1 {
                            var_arr.remove(at: var_index)
                        }else{
                            var_arr.insert(var_saveModel, at: 0)
                        }
                    }else{
                        if var_index != -1 {
                            var_arr.remove(at: var_index)
                        }
                        var_arr.insert(var_saveModel, at: 0)
                    }
                }else{
                    var_arr.append(var_saveModel)
                }
            }
        }else{
            var_arr.append(var_saveModel)
        }
        UserDefaults.standard.set(var_arr.toJSONString(), forKey: var_key)
        return true
    }
    
    func ht_getHistoryDatasource()->[HTClassModelMV]{
        let var_key = String(format: "%@_%@",String.STATIC_history,ht_AsciiString("data"))
        let var_jsonStr:String? = UserDefaults.standard.object(forKey: var_key) as? String
        var var_arr:[HTClassModelMV] = []
        if let var_arrr = [HTClassModelMV].deserialize(from: var_jsonStr) {
            var_arrr.forEach { m in
                if let m = m {
                    var_arr.append(m)
                }
            }
        }
        return var_arr
    }
    
    func ht_checkLockIds(var_ids:String?) -> Bool{
        guard let var_ids = var_ids else {return false}
        let var_key = String(format: "%@_%@",String.STATIC_lock_ids,ht_AsciiString("data"))
        if let var_arr =  UserDefaults.standard.array(forKey: var_key) as? [String]{
            if var_arr.contains(var_ids) {
                return true
            }
        }
        return false
    }
     
    func ht_saveLockIds(var_ids:String?){
        guard let var_ids = var_ids else {return}
        let var_key = String(format: "%@_%@",String.STATIC_lock_ids,ht_AsciiString("data"))
        var var_saveArr:[String] = []
        if let var_arr =  UserDefaults.standard.array(forKey: var_key) as? [String]{
            for var_m in var_arr{
                if var_m != var_ids {
                    var_saveArr.append(var_m)
                }
            }
        }
        var_saveArr.append(var_ids)
        UserDefaults.standard.set(var_saveArr, forKey: var_key)
    }
    
    func ht_requestTakePartInfoParams() -> NSDictionary {
        let var_payModel = var_payModel
        let var_dict : NSMutableDictionary = [:]
        var_dict[ht_AsciiString("apk_name")] = Bundle.main.bundleIdentifier
        var var_p1String : String = "0"
        var var_p2String : String = "0"
        var var_t1String : String = "0"
        var var_sub1String : String = "0"
        var var_sub2String : String = "0"
        var var_subidString : String = "0"
        if(HTClassShare.default.ht_checkSub()){
            if(var_payModel!.var_local?.var_value == "1"){
                var_p1String = HTClassPayUntils.default.var_payID ?? "0"
                var_p2String = "1"
                var_sub1String = var_payModel!.var_local?.var_auto_renew_status ?? "0"
            }
            var_subidString = var_payModel!.var_server?.var_app_id ?? "0"
            var_t1String = (var_payModel!.var_server?.var_t1 == "2") ? "2": "1"
            if(var_payModel!.var_device?.var_val == "1"){
                var_p1String = var_payModel!.var_device?.var_pid ?? "0"
                var_t1String = "2"
                var_p2String = "2"
            }
            if (var_payModel!.var_server?.var_val2 == "1") {
                var_p1String = var_payModel!.var_server?.var_pid ?? "0"
                var_sub2String = var_payModel!.var_server?.var_auto_renew_status ?? "0"
                var_p2String = "2"
            } else if (var_payModel!.var_family?.var_val == "1") {
                var_p1String = var_payModel!.var_family?.var_pid ?? "0"
                var_sub2String = var_payModel!.var_family?.var_auto_renew_status ?? "0"
                var_p2String = "2"
            }
        }
        var_dict[ht_AsciiString("p1")] = var_p1String
        var_dict[ht_AsciiString("p2")] = var_p2String
        var_dict[ht_AsciiString("t1")] = var_t1String
        var_dict[ht_AsciiString("sub1")] = var_sub1String
        var_dict[ht_AsciiString("sub2")] = var_sub2String
        var_dict[ht_AsciiString("subid")] = var_subidString
        return var_dict
    }
    
    func ht_uid() -> String {
        if let var_userModel = var_userModel,!var_userModel.var_uid.isEmpty{
            return var_userModel.var_uid
        }
        return "0"//4171991
    }
    func ht_fid()->String{
        if let model = var_loginUserModel,!model.var_fid.isEmpty{
            return model.var_fid
        }
        return "0"//139554
    }
}
