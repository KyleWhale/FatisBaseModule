//
//  HTClassProperty.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/2.
//

import Foundation

class HTClassProperty {
    static var STATIC_Start: String {
        get {
            return HTClassShare.default.var_configModel?.var_applovin?.var_start ?? ""
        }
    }
    static var STATIC_Reward: String {
        get {
            return HTClassShare.default.var_configModel?.var_applovin?.var_reward ?? ""
        }
    }
    static var STATIC_Inter: String {
        get {
            return HTClassShare.default.var_configModel?.var_applovin?.var_inter ?? ""
        }
    }
    static var STATIC_Banner: String {
        get {
            return HTClassShare.default.var_configModel?.var_applovin?.var_banner ?? ""
        }
    }
    static var STATIC_MREC: String {
        get {
            return HTClassShare.default.var_configModel?.var_applovin?.var_mrec ?? ""
        }
    }    
}

extension String{
    ///udf_first
    static let STATIC_first =  "udf_first"
    ///udf_white
    static let STATIC_white =  "udf_white"
    
    ///STATIC_noAlert
    static let STATIC_noAlert =  "udf_noAlert"
    
    ///user
    static let STATIC_user =  "udf_user"
    ///udf_subscribeModel
    static let STATIC_subscribe =  "udf_subscribe"
    ///config
    static let STATIC_config =  "udf_config"
    ///share
    static let STATIC_share =  "udf_share"
    ///udf_payModel
    static let STATIC_payModel =  "udf_payModel"
    ///关闭首页广告
    static let STATIC_closeHomeCenterAd =  "udf_closeHomeCenterAd"
    ///loginUser
    static let STATIC_loginuser =  "udf_loginuser"
    ///historysearch
    static let STATIC_searchhistory =  "udf_searchhistory"
    ///udf_history
    static let STATIC_history =  "udf_history"
    ///udf_collect
    static let STATIC_collect =  "udf_collect"
    ///app启动次数
    static let STATIC_operationCounts = "udf_operationCounts"
    ///app安装时间
    static let STATIC_installtime =  "udf_installtime"
    ///app启动时间
    static let STATIC_launchTime =  "udf_launchTime"
    ///18禁
    static let STATIC_hideOneNight =  "udf_hideOneNight"
    ///进入首页方式
    static let STATIC_op_type =  "udf_op_type"
    ///插屏时间间隔
    static let STATIC_inter_screen_ad_secs =  "udf_inter_screen_ad_secs"
    ///激励时间间隔
    static let STATIC_banner_ad_secs =  "udf_banner_ad_secs"
    ///解锁过的电影
    static let STATIC_lock_ids =  "udf_lock_ids"
    ///udf_kocava
    static let STATIC_kocava =  "udf_kocava"
    
    //movie 埋点相关
    ///进入播放页
    static let STATIC_point_movie_enter =  "udf_point_movie_enter"
    ///服务器请求
    static let STATIC_point_movie_server =  "udf_point_movie_server"
    ///播放
    static let STATIC_point_movie_play =  "udf_point_movie_play"
    ///播放链接
    static let STATIC_point_movie_link =  "udf_point_movie_link"
    ///解析
    static let STATIC_point_movie_xml =  "udf_point_movie_xml"
    
    ///解析
    static let STATIC_free_month =  "udf_free_month"
    ///解析
    static let STATIC_paid_product =  "udf_paid_product"
}

extension NSNotification.Name {
    public struct var_notification {
        ///退出
        public static let var_UserLogout =  Notification.Name(rawValue:"udf_UserLogout")

        ///切换字幕
        public static let var_ChangeSRT =  Notification.Name(rawValue:"udf_ChangeSRT")
        ///切换播放速度
        public static let var_ChangeSpeed =  Notification.Name(rawValue:"udf_ChangeSpeed")
        
        ///相关搜索
        public static let var_string_search_related =  Notification.Name(rawValue:"udf_search_related")
        ///刷新搜索词
        public static let var_string_save_seaech_word =  Notification.Name(rawValue:"udf_save_seaech_word")
        
        ///切换语言
        public static let var_Changelanguege =  Notification.Name(rawValue:"udf_Changelanguege")
        ///展示多少季弹窗
        public static let var_ChangeSesssionAction =  Notification.Name(rawValue:"udf_ChangeSesssionAction")
        ///所有季弹窗
        public static let var_AllSesssionAction =  Notification.Name(rawValue:"udf_AllSesssionAction")
        ///选择哪一季
        public static let var_SelectSesssionAction =  Notification.Name(rawValue:"udf_SelectSesssionAction")
        ///选择电视剧剧集
        public static let var_SelectEpsAction =  Notification.Name(rawValue:"udf_SelectEpsAction")
        ///隐藏字幕
        public static let var_hideSubtitleAction =  Notification.Name(rawValue:"udf_hideSubtitleAction")
        ///进入后台
        public static let var_EnterBackground =  Notification.Name(rawValue:"udf_EnterBackground")
        ///进入前台
        public static let var_EnterForground =  Notification.Name(rawValue:"udf_EnterForground")
        public static let var_EnterMovieForground =  Notification.Name(rawValue:"udf_EnterMovieForground")
        ///在播放页一些其他操作结束的通知
        public static let var_MovieAdEnd =  Notification.Name(rawValue:"udf_MovieAdEnd")
        ///解锁分享
        public static let var_MovieLockShareEnd =  Notification.Name(rawValue:"udf_MovieLockShareEnd")
        ///字幕时间控制
        public static let var_MovieSubmitControl = Notification.Name(rawValue: "udf_MovieSubmitControl")
        ///关闭旋转
        public static let var_Rotation_CLOSE =  Notification.Name(rawValue:"udf_Rotation_CLOSE")
        ///开启旋转)
        public static let var_Rotation_OPEN =  Notification.Name(rawValue:"udf_Rotation_OPEN")
        ///下一集
        public static let var_NextSkipAction =  Notification.Name(rawValue:"udf_NextSkipAction")
        ///更新历史和收藏
        public static let var_UpdateHistoryMovie =  Notification.Name(rawValue:"udf_UpdateHistoryMovie")
        ///订阅接口信息更新
        public static let var_SubModel =  Notification.Name(rawValue:"udf_SubModel")
        ///分享接口信息更新
        public static let var_ShareModel =  Notification.Name(rawValue:"udf_ShareModel")
        ///back
        public static let var_Back =  Notification.Name(rawValue:"udf_Back")
        ///NTFCTString_MovieShare
        public static let var_MovieShare =  Notification.Name(rawValue:"udf_MovieShare")
        ///NTFCTString_MovieCollect
        public static let var_MovieCollect =  Notification.Name(rawValue:"udf_MovieCollect")
        ///NTFCTString_MovieAd
        public static let var_MovieGoAd =  Notification.Name(rawValue:"udf_MovieGoAd")
        ///NTFCTString_MovieCC
        public static let var_MovieCC =  Notification.Name(rawValue:"udf_MovieCC")
        ///NTFCTString_MovieTou
        public static let var_MovieTou =  Notification.Name(rawValue:"udf_MovieTou")
        ///NTFCTString_MovieEpisod
        public static let var_MovieEpisod =  Notification.Name(rawValue:"udf_MovieEpisod")
        ///NTFCTString_MovieGETPRIMIUM
        public static let var_MovieGETPRIMIUM =  Notification.Name(rawValue:"udf_MovieGETPRIMIUM")
        ///NTFCTString_MovieQuickLeft
        public static let var_MovieQuickLeft =  Notification.Name(rawValue:"udf_MovieQuickLeft")
        ///NTFCTString_MovieQuickRight
        public static let var_MovieQuickRight =  Notification.Name(rawValue:"udf_MovieQuickRight")
        ///NTFCTString_MovieClickMovie
        public static let var_MovieClickMovie =  Notification.Name(rawValue:"udf_MovieClickMovie")
        ///ActivityEnd
        public static let var_ActivityEnd =  Notification.Name(rawValue:"udf_ActivityEnd")
        
        ///购买成功
        public static let var_paySuccess =  Notification.Name(rawValue:"udf_paySuccess")
        ///购买成功
        public static let var_boot_end =  Notification.Name(rawValue:"udf_boot_end")
        ///验证完成
        public static let var_verifyCompletion =  Notification.Name(rawValue:"udf_verify_completion")
    }
}

public enum HTEnumWindowView: Int {
    case htEnumBubBoot  = 1111
    case htEnumActivity  = 1112
    case htEnumNoti  = 1113
    case htEnumBig  = 1114
}
