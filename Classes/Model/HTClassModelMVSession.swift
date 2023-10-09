//
//  HTClassModelMVSession.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelMVSession: HTClassModelHandJson {
    var var_id = ""
    var var_title = ""
    var var_select = false
    var var_tempSelect = false
    var var_eps_list:[HTClassModelMV?] = []
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_title <-- ht_AsciiString("title")
    }
}
