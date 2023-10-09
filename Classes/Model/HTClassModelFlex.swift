//
//  HTClassModelFlex.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelFlex: HTClassModelHandJson {
    var var_id = 0
    var var_select = false
    var var_index = 0
    var var_type = 0
    var var_title = ""
    var var_cover = ""
    var var_api = ""
    var var_params:[HTClassModelFlexParam] = []
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_type <-- ht_AsciiString("type")
        mapper <<< self.var_title <-- ht_AsciiString("title")
        mapper <<< self.var_cover <-- ht_AsciiString("cover")
        mapper <<< self.var_api <-- ht_AsciiString("api")
        mapper <<< self.var_params <-- ht_AsciiString("params")
    }
}
