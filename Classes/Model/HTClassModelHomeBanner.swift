//
//  HTClassModelHomeBanner.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelHomeBanner: HTClassModelHandJson {
    var var_new_img = ""
    var var_new_conf_name = ""
    var var_new_conf_value = ""
    var var_new_conf_type = 0
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_new_conf_type <-- ht_AsciiString("new_conf_type")
        mapper <<< self.var_new_img <-- ht_AsciiString("new_img")
        mapper <<< self.var_new_conf_value <-- ht_AsciiString("new_conf_value")
        mapper <<< self.var_new_img <-- ht_AsciiString("new_img")
    }
}
