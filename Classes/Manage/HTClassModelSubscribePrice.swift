//
//  HTClassModelSubscribePrice.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/22.
//

import UIKit

class HTClassModelSubscribePrice: HTClassModelHandJson {
    var var_id = ""
    var var_price = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_price <-- ht_AsciiString("price")
    }
}
