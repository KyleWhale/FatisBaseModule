//
//  HTClassModelHomeList.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelHomeList: HTClassModelHandJson {
    var var_data_type = ""
    var var_display_type = ""
    var var_order = 0
    var var_id = ""
    var var_name = ""
    var var_seeall = ""
    var var_moreflag = ""
    var var_seeall_value = ""
    var var_open_mode_value = ""
    var var_data:[[String:Any]] = []
    var var_name2 = ""
    var var_s3 = ""
    var var_s3img = ""
    var var_appleid = ""
    var var_bundleid = ""
    var var_l1 = ""
    var var_icon1 = ""
    var var_text1 = ""
    var var_text2 = ""
    var var_k2 = ""
    var var_secname = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_data_type <-- ht_AsciiString("data_type")
        mapper <<< self.var_display_type <-- ht_AsciiString("display_type")
        mapper <<< self.var_order <-- ht_AsciiString("order")
        mapper <<< self.var_name <-- ht_AsciiString("name")
        mapper <<< self.var_seeall <-- ht_AsciiString("seeall")
        mapper <<< self.var_moreflag <-- ht_AsciiString("moreflag")
        mapper <<< self.var_seeall_value <-- ht_AsciiString("seeall_value")
        mapper <<< self.var_open_mode_value <-- ht_AsciiString("open_mode_value")
        mapper <<< self.var_data <-- ht_AsciiString("data")
        mapper <<< self.var_name2 <-- ht_AsciiString("name2")
        mapper <<< self.var_s3 <-- ht_AsciiString("s3")
        mapper <<< self.var_s3img <-- ht_AsciiString("s3img")
        mapper <<< self.var_appleid <-- ht_AsciiString("appleid")
        mapper <<< self.var_bundleid <-- ht_AsciiString("bundleid")
        mapper <<< self.var_l1 <-- ht_AsciiString("l1")
        mapper <<< self.var_icon1 <-- ht_AsciiString("icon1")
        mapper <<< self.var_text1 <-- ht_AsciiString("text1")
        mapper <<< self.var_text2 <-- ht_AsciiString("text2")
        mapper <<< self.var_k2 <-- ht_AsciiString("k2")
        mapper <<< self.var_secname <-- ht_AsciiString("secname")
    }
}
