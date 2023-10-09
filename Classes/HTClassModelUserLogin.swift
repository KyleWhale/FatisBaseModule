//
//  HTClassModelUserLogin.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

import Foundation
import HandyJSON
class HTClassModelUserLogin:HTClassModelHandJson{
    var var_app_id:String = ""
    var var_uid:String = ""
    var var_master:String = ""
    var var_fav_plid:String = ""
    var var_s1:String = ""
    var var_val:String = ""
    var var_fid:String = ""
    var var_pid:String = ""
    var var_vp:String = ""
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_app_id <-- ht_AsciiString("app_id")
        mapper <<< self.var_uid <-- ht_AsciiString("uid")
        mapper <<< self.var_master <-- ht_AsciiString("master")
        mapper <<< self.var_fav_plid <-- ht_AsciiString("fav_plid")
        mapper <<< self.var_s1 <-- ht_AsciiString("s1")
        mapper <<< self.var_val <-- ht_AsciiString("val")
        mapper <<< self.var_fid <-- ht_AsciiString("fid")
        mapper <<< self.var_pid <-- ht_AsciiString("pid")
        mapper <<< self.var_vp <-- ht_AsciiString("vp")
    }
}
