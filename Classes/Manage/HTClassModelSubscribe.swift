//
//  HTClassModelSubscribe.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/22.
//

import UIKit

class HTClassModelSubscribe: HTClassModelHandJson {
    var var_k3:[String] = []
    var var_k12 = 0
    var var_family = ""
    var var_year:HTClassModelSubscribePrice?
    var var_week:HTClassModelSubscribePrice?
    var var_month:HTClassModelSubscribePrice?
    var var_k13 = 0
    var var_h1:[String] = []
    var var_p1:[String:Any] = [:]
    var var_p2:[String:Any] = [:]
    var var_data2:[String:HTClassModelFakeCard] = [:]
    
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_k3 <-- ht_AsciiString("k3")
        mapper <<< self.var_k12 <-- ht_AsciiString("k12")
        mapper <<< self.var_family <-- ht_AsciiString("family")
        mapper <<< self.var_year <-- ht_AsciiString("year")
        mapper <<< self.var_week <-- ht_AsciiString("week")
        mapper <<< self.var_month <-- ht_AsciiString("month")
        mapper <<< self.var_k13 <-- ht_AsciiString("k13")
        mapper <<< self.var_data2 <-- ht_AsciiString("data2")
        mapper <<< self.var_h1 <-- ht_AsciiString("h1")
        mapper <<< self.var_p1 <-- ht_AsciiString("p1")
        mapper <<< self.var_p2 <-- ht_AsciiString("p2")
        
    }
}
