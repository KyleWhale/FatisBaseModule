//
//  HTClassModelApplovin.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/22.
//

import UIKit

class HTClassModelApplovin: HTClassModelHandJson {
    var var_account = ""
    var var_inter = ""
    var var_start = ""
    var var_banner = ""
    var var_reward = ""
    var var_mrec = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_account <-- ht_AsciiString("account")
        mapper <<< self.var_inter <-- ht_AsciiString("inter")
        mapper <<< self.var_start <-- ht_AsciiString("start")
        mapper <<< self.var_banner <-- ht_AsciiString("banner")
        mapper <<< self.var_reward <-- ht_AsciiString("reward")
        mapper <<< self.var_mrec <-- ht_AsciiString("mrec")
    }
}
