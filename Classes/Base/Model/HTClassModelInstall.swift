//
//  HTClassModelInstall.swift
//  ProjectSwift
//
//  Created by wmz on 2023/8/17.
//

import UIKit

class HTClassModelInstall: HTClassModelHandJson {
    var var_appbundleid = ""
    var var_appid = ""
    var var_appleid = ""
    var var_appname = ""
    var var_force = ""
    var var_p1 = ""
    var var_p2 = ""
    var var_type = ""
    var var_uid = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_appbundleid <-- ht_AsciiString("appbundleid")
        mapper <<< self.var_appid <-- ht_AsciiString("appid")
        mapper <<< self.var_appleid <-- ht_AsciiString("appleid")
        mapper <<< self.var_appname <-- ht_AsciiString("appname")
        mapper <<< self.var_force <-- ht_AsciiString("force")
        mapper <<< self.var_p1 <-- ht_AsciiString("p1")
        mapper <<< self.var_p2 <-- ht_AsciiString("p2")
        mapper <<< self.var_type <-- ht_AsciiString("type")
        mapper <<< self.var_uid <-- ht_AsciiString("uid")
    }
}
