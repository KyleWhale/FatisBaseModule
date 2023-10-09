//
//  HTClassModelLocalPay.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

class HTClassModelLocalPay: HTClassModelHandJson {
    var var_k5 = ""
    var var_value = ""
    var var_pid = ""
    ///失效时间
    var var_k6:Int64 = 0
    ///购买时间
    var var_k7 = ""
    var var_apple_server_status = ""
    ///是否有推介优惠
    var var_is_in_intro_offer_period = false
    ///是否有试用
    var var_is_trial_period = ""
    ///1,// 是否自动续订：1续订，0不续订
    var var_auto_renew_status = ""
    var var_tbu = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_pid <-- ht_AsciiString("pid")
        mapper <<< self.var_k5 <-- ht_AsciiString("k5")
        mapper <<< self.var_is_in_intro_offer_period <-- ht_AsciiString("is_in_intro_offer_period")
        mapper <<< self.var_value <-- ht_AsciiString("value")
        mapper <<< self.var_k6 <-- ht_AsciiString("k6")
        mapper <<< self.var_k7 <-- ht_AsciiString("k7")
        mapper <<< self.var_apple_server_status <-- ht_AsciiString("apple_server_status")
        mapper <<< self.var_is_trial_period <-- ht_AsciiString("is_trial_period")
        mapper <<< self.var_auto_renew_status <-- ht_AsciiString("auto_renew_status")
        mapper <<< self.var_tbu <-- ht_AsciiString("tbu")
    }
}
