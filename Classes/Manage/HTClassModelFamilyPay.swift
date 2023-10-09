//
//  HTClassModelFamilyPay.swift
//  ProjectSwift
//
//  Created by wmz on 2023/8/22.
//

class HTClassModelFamilyPay: HTClassModelHandJson {
    var var_auto_renew_status = ""
    var var_fid = ""
    var var_is_in_intro_offer_period = ""
    var var_is_trial_period = ""
    var var_k6 = ""
    var var_k7 = ""
    var var_k5 = ""
    var var_master = ""
    var var_pid = ""
    var var_val = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_auto_renew_status <-- ht_AsciiString("auto_renew_status")
        mapper <<< self.var_fid <-- ht_AsciiString("fid")
        mapper <<< self.var_is_in_intro_offer_period <-- ht_AsciiString("is_in_intro_offer_period")
        mapper <<< self.var_is_trial_period <-- ht_AsciiString("is_trial_period")
        mapper <<< self.var_k6 <-- ht_AsciiString("k6")
        mapper <<< self.var_k7 <-- ht_AsciiString("k7")
        mapper <<< self.var_k5 <-- ht_AsciiString("k5")
        mapper <<< self.var_master <-- ht_AsciiString("master")
        mapper <<< self.var_pid <-- ht_AsciiString("pid")
        mapper <<< self.var_val <-- ht_AsciiString("val")
    }
}
