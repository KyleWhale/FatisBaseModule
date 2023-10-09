//
//  HTClassModelPush.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/25.
//

import UIKit

class HTClassModelPush: HTClassModelHandJson {
    var var_flag = 0
    var var_mid = ""
    var var_title = ""
    var var_id = ""
    var var_mname = ""
    var var_TTid = ""
    var var_TTname = ""
    var var_TTeps = ""
    var var_eps_id = ""
    var var_type = ""
    var var_text = ""
    var var_ss_id = ""
    var var_jobid = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_flag <-- ht_AsciiString("flag")
        mapper <<< self.var_mid <-- ht_AsciiString("mid")
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_title <-- ht_AsciiString("title")
        mapper <<< self.var_jobid <-- ht_AsciiString("jobid")
        mapper <<< self.var_mname <-- ht_AsciiString("mname")
        mapper <<< self.var_TTid <-- ht_AsciiString("TTid")
        mapper <<< self.var_TTname <-- ht_AsciiString("TTname")
        mapper <<< self.var_TTeps <-- ht_AsciiString("TTeps")
        mapper <<< self.var_eps_id <-- ht_AsciiString("eps_id")
        mapper <<< self.var_type <-- ht_AsciiString("type")
        mapper <<< self.var_text <-- ht_AsciiString("text")
        mapper <<< self.var_ss_id <-- ht_AsciiString("ss_id")
    }
}
