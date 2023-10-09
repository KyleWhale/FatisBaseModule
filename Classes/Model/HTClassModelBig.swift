//
//  HTClassModelBig.swift
//  ProjectSwift
//
//  Created by wmz on 2023/8/9.
//

import UIKit

class HTClassModelBig: HTClassModelHandJson {
    var var_id = ""
    var var_type = ""
    var var_cover = ""
    var var_name = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_type <-- ht_AsciiString("type")
        mapper <<< self.var_cover <-- ht_AsciiString("cover")
        mapper <<< self.var_name <-- ht_AsciiString("name")
    }
}
