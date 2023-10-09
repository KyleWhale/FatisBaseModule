//
//  HTClassModelDevicePay.swift
//  ProjectSwift
//
//  Created by wmz on 2023/8/22.
//

class HTClassModelDevicePay: HTClassModelHandJson {
    var var_f1 = ""
    var var_k6 = ""
    var var_k7 = ""
    var var_pid = ""
    var var_val = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_f1 <-- ht_AsciiString("f1")
        mapper <<< self.var_k6 <-- ht_AsciiString("k6")
        mapper <<< self.var_k7 <-- ht_AsciiString("k7")
        mapper <<< self.var_pid <-- ht_AsciiString("pid")
        mapper <<< self.var_val <-- ht_AsciiString("val")
    }
}
