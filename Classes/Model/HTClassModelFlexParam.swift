//
//  HTClassModelFlexParam.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelFlexParam: HTClassModelHandJson {
    var var_key1 = ""
    var var_val1 = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_key1 <-- ht_AsciiString("key1")
        mapper <<< self.var_val1 <-- ht_AsciiString("val1")
    }
}
