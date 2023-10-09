//
//  HTClassModelConfig.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/22.
//

import UIKit

class HTClassModelConfig: HTClassModelHandJson {
    var var_inter_screen_ad_secs = 0
    var var_banner_ad_secs = 0
    var var_mbanner_secs = 0
    var var_play_lock_tlimit = 0
    var var_m1 = 0
    var var_applovin:HTClassModelApplovin?
    var var_i3:[String] = []
    var var_tel1:[String] = []
    var var_airplay:[String:Any] = [:]
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_inter_screen_ad_secs <-- ht_AsciiString("inter_screen_ad_secs")
        mapper <<< self.var_banner_ad_secs <-- ht_AsciiString("banner_ad_secs")
        mapper <<< self.var_mbanner_secs <-- ht_AsciiString("mbanner_secs")
        mapper <<< self.var_play_lock_tlimit <-- ht_AsciiString("play_lock_tlimit")
        mapper <<< self.var_m1 <-- ht_AsciiString("m1")
        mapper <<< self.var_applovin <-- ht_AsciiString("applovin")
        mapper <<< self.var_inter_screen_ad_secs <-- ht_AsciiString("inter_screen_ad_secs")
        mapper <<< self.var_i3 <-- ht_AsciiString("i3")
        mapper <<< self.var_airplay <-- ht_AsciiString("airplay")
        mapper <<< self.var_tel1 <-- ht_AsciiString("tel1")
    }
}
