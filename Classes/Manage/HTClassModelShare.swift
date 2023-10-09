//
//  HTClassModelShare.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/22.
//

import UIKit

class HTClassModelShare: HTClassModelHandJson {
    var var_link = ""
    var var_text = ""
    var var_song_link = ""
    var var_song_text = ""
    var var_mtext = ""
    var var_mlink = ""
    var var_tttext = ""
    var var_ttlink = ""
    var var_text1 = ""
    var var_mlocklink = ""
    var var_text2 = ""
    var var_ttlocklink = ""
    var var_app_link = ""
    var var_app_text = ""
    var var_appm_link = ""
    var var_appm_text = ""
    var var_gd_nstll:HTClassModelGdNstll?
    var var_d2:HTClassModelGdNstll?
    var var_region_tag = ""

    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_link <-- ht_AsciiString("link")
        mapper <<< self.var_text <-- ht_AsciiString("text")
        mapper <<< self.var_song_link <-- ht_AsciiString("song_link")
        mapper <<< self.var_song_text <-- ht_AsciiString("song_text")
        mapper <<< self.var_mtext <-- ht_AsciiString("mtext")
        mapper <<< self.var_mlink <-- ht_AsciiString("mlink")
        mapper <<< self.var_tttext <-- ht_AsciiString("tttext")
        mapper <<< self.var_ttlink <-- ht_AsciiString("ttlink")
        mapper <<< self.var_text1 <-- ht_AsciiString("text1")
        mapper <<< self.var_mlocklink <-- ht_AsciiString("mlocklink")
        mapper <<< self.var_text2 <-- ht_AsciiString("text2")
        mapper <<< self.var_ttlocklink <-- ht_AsciiString("ttlocklink")
        mapper <<< self.var_app_link <-- ht_AsciiString("app_link")
        mapper <<< self.var_app_text <-- ht_AsciiString("app_text")
        mapper <<< self.var_appm_link <-- ht_AsciiString("appm_link")
        mapper <<< self.var_appm_text <-- ht_AsciiString("appm_text")
        mapper <<< self.var_gd_nstll <-- ht_AsciiString("gd_nstll")
        mapper <<< self.var_d2 <-- ht_AsciiString("d2")
        mapper <<< self.var_region_tag <-- ht_AsciiString("region_tag")
    }
}
