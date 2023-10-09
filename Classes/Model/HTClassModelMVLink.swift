//
//  HTClassModelMVLink.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelMVLink: HTClassModelHandJson {
    var var_link = ""
    var var_size = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_link <-- ht_AsciiString("link")
        mapper <<< self.var_size <-- ht_AsciiString("size")
    }
}
