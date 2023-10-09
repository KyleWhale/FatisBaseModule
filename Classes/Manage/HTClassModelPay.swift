//
//  HTClassModelPay.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

import Foundation

class HTClassModelPay:HTClassModelHandJson{
    var var_local:HTClassModelLocalPay?
    var var_server:HTClassModelServerPay?
    var var_device:HTClassModelDevicePay?
    var var_family:HTClassModelFamilyPay?
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_local <-- ht_AsciiString("local")
        mapper <<< self.var_server <-- ht_AsciiString("server")
        mapper <<< self.var_device <-- ht_AsciiString("device")
        mapper <<< self.var_family <-- ht_AsciiString("family")
    }
}

