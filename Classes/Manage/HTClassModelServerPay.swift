//
//  HTClassModelServerPay.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

class HTClassModelServerPay: HTClassModelHandJson {
    var var_val2 = ""
    var var_app_os = ""
    var var_shelf = ""
    var var_app_id = ""
    var var_app_name = ""
    var var_k6:Int64 = 0
    var var_k7 = ""
    var var_k5 = ""
    var var_ubt = false
    var var_logout = 0
    var var_pid = ""
    var var_is_trial_period = ""
    var var_is_in_intro_offer_period = ""
    var var_auto_renew_status = ""
    var var_t1 = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_val2 <-- ht_AsciiString("val2")
        mapper <<< self.var_app_os <-- ht_AsciiString("app_os")
        mapper <<< self.var_shelf <-- ht_AsciiString("shelf")
        mapper <<< self.var_app_id <-- ht_AsciiString("app_id")
        mapper <<< self.var_app_name <-- ht_AsciiString("app_name")
        mapper <<< self.var_k6 <-- ht_AsciiString("k6")
        mapper <<< self.var_k7 <-- ht_AsciiString("k7")
        mapper <<< self.var_k5 <-- ht_AsciiString("k5")
        mapper <<< self.var_ubt <-- ht_AsciiString("ubt")
        mapper <<< self.var_logout <-- ht_AsciiString("logout")
        mapper <<< self.var_pid <-- ht_AsciiString("pid")
        mapper <<< self.var_is_trial_period <-- ht_AsciiString("is_trial_period")
        mapper <<< self.var_is_in_intro_offer_period <-- ht_AsciiString("is_in_intro_offer_period")
        mapper <<< self.var_auto_renew_status <-- ht_AsciiString("auto_renew_status")
        mapper <<< self.var_t1 <-- ht_AsciiString("t1")
    }
}
