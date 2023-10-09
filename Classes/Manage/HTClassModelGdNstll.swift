//
//  HTClassModelGdNstll.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/22.
//

import UIKit

class HTClassModelGdNstll: HTClassModelHandJson {
    var var_a1 = ""
    var var_cancel = ""
    var var_l1 = ""
    var var_l2 = ""
    var var_link = ""
    var var_status = 0
    var var_t3 = ""
    var var_text = ""
    var var_title = ""
    var var_update = ""
    var var_k1 = 0
    var var_t4 = ""
    var var_t1 = ""
    var var_t2 = ""
    var var_b1 = ""
    var var_b2 = ""
    var var_k2 = 0
    var var_c4 = ""
    var var_c5 = ""
    var var_logo = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_a1 <-- ht_AsciiString("a1")
        mapper <<< self.var_cancel <-- ht_AsciiString("cancel")
        mapper <<< self.var_l1 <-- ht_AsciiString("l1")
        mapper <<< self.var_l2 <-- ht_AsciiString("l2")
        mapper <<< self.var_link <-- ht_AsciiString("link")
        mapper <<< self.var_status <-- ht_AsciiString("status")
        mapper <<< self.var_t3 <-- ht_AsciiString("t3")
        mapper <<< self.var_text <-- ht_AsciiString("text")
        mapper <<< self.var_title <-- ht_AsciiString("title")
        mapper <<< self.var_update <-- ht_AsciiString("update")
        mapper <<< self.var_k1 <-- ht_AsciiString("k1")
        mapper <<< self.var_t4 <-- ht_AsciiString("t4")
        mapper <<< self.var_t1 <-- ht_AsciiString("t1")
        mapper <<< self.var_t2 <-- ht_AsciiString("t2")
        mapper <<< self.var_b1 <-- ht_AsciiString("b1")
        mapper <<< self.var_b2 <-- ht_AsciiString("b2")
        mapper <<< self.var_k2 <-- ht_AsciiString("k2")
        mapper <<< self.var_c4 <-- ht_AsciiString("c4")
        mapper <<< self.var_c5 <-- ht_AsciiString("c5")
        mapper <<< self.var_logo <-- ht_AsciiString("logo")
    }
}
