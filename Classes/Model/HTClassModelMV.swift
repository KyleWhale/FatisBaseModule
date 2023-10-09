//
//  HTClassModelMV.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/15.
//

import UIKit

class HTClassModelMV: HTClassModelHandJson {
    ///1.电影；2.电视剧；3.预告片；4.枪版电影(CAM)
    var var_mtype = ""
    var var_medit = 0
    var var_id = ""
    var var_title = ""
    var var_cover = ""
    var var_rate = ""
    var var_data_type = ""
    var var_eps_cnts = ""
    var var_pub_date = ""
    var var_ssn_id = ""
    var var_eps_list:[HTClassModelMV] = []
    var var_stars = ""
    var var_tags = ""
    var var_country = ""
    var var_quality = ""
    var var_ss_eps = ""
    var var_ne_flag = ""
    var var_nw_flag = ""
    var var_board = ""
    var var_sub = ""
    var var_dub = ""
    var var_ep = ""
    var var_age = ""
    var var_m_type_2 = ""
    var var_source = ""
    var var_description = ""
    var var_v_360p = ""
    var var_v_720p = ""
    var var_v_1080p = ""
    var var_star_name = ""
    var var_tt_id = ""
    var var_hd:HTClassModelMVLink?
    var var_sd:HTClassModelMVLink?
    var var_ssn_list:[HTClassModelMVSession] = []
    var var_eps_num = 0
    
    var var_rctInfo:[String:[HTClassModelMVSRT]] = [:]
    var var_currentSRTModel:HTClassModelMVSRT?
    var var_subtitleTime = 0
    var var_subtitleIndex = 0
    var var_step = 0
    var var_stepCurrentTime = 0.0
    var var_stepMovieId:String?
    var var_stepSessionId:String?
    var var_stepLanguage:String?
    var var_languageDatasource:[HTClassModelBase] = []
    var var_currentLanguageMdoel:HTClassModelBase?
    var var_timeshow = false
    var var_subtitleShow = true
    var var_shouldOpen = false
    var var_height = 0.0
    var var_select = false
    var var_show = false
    var var_ad = false
    var var_play_lock = 1
    var var_img = ""
    var var_name = ""
    var var_channelType = ""
    
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_play_lock <-- ht_AsciiString("play_lock")
        mapper <<< self.var_mtype <-- ht_AsciiString("mtype")
        mapper <<< self.var_medit <-- ht_AsciiString("medit")
        mapper <<< self.var_title <-- ht_AsciiString("title")
        mapper <<< self.var_id <-- ht_AsciiString("id")
        mapper <<< self.var_cover <-- ht_AsciiString("cover")
        mapper <<< self.var_rate <-- ht_AsciiString("rate")
        mapper <<< self.var_data_type <-- ht_AsciiString("data_type")
        mapper <<< self.var_eps_cnts <-- ht_AsciiString("eps_cnts")
        mapper <<< self.var_pub_date <-- ht_AsciiString("pub_date")
        mapper <<< self.var_ssn_id <-- ht_AsciiString("ssn_id")
        mapper <<< self.var_stars <-- ht_AsciiString("stars")
        mapper <<< self.var_tags <-- ht_AsciiString("tags")
        mapper <<< self.var_country <-- ht_AsciiString("country")
        mapper <<< self.var_quality <-- ht_AsciiString("quality")
        mapper <<< self.var_ss_eps <-- ht_AsciiString("ss_eps")
        mapper <<< self.var_ne_flag <-- ht_AsciiString("new_flag")
        mapper <<< self.var_nw_flag <-- ht_AsciiString("nw_flag")
        mapper <<< self.var_board <-- ht_AsciiString("board")
        mapper <<< self.var_sub <-- ht_AsciiString("sub")
        mapper <<< self.var_dub <-- ht_AsciiString("dub")
        mapper <<< self.var_ep <-- ht_AsciiString("ep")
        mapper <<< self.var_age <-- ht_AsciiString("age")
        mapper <<< self.var_m_type_2 <-- ht_AsciiString("m_type_2")
        mapper <<< self.var_source <-- ht_AsciiString("source")
        mapper <<< self.var_description <-- ht_AsciiString("description")
        mapper <<< self.var_v_360p <-- ht_AsciiString("v_360p")
        mapper <<< self.var_v_720p <-- ht_AsciiString("v_720p")
        mapper <<< self.var_v_1080p <-- ht_AsciiString("v_1080p")
        mapper <<< self.var_star_name <-- ht_AsciiString("star_name")
        mapper <<< self.var_hd <-- ht_AsciiString("hd")
        mapper <<< self.var_sd <-- ht_AsciiString("sd")
        mapper <<< self.var_ssn_list <-- ht_AsciiString("ssn_list")
        mapper <<< self.var_eps_num <-- ht_AsciiString("eps_num")
        mapper <<< self.var_tt_id <-- ht_AsciiString("tt_id")
        mapper <<< self.var_img <-- ht_AsciiString("img")
        mapper <<< self.var_name <-- ht_AsciiString("name")
        mapper <<< self.var_channelType <-- ht_AsciiString("channelType")
    }
}
