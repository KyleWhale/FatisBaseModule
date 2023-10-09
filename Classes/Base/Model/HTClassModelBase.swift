//
//  HTClassModelBase.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

import UIKit
import HandyJSON

class HTClassModelBase: HandyJSON {
    var var_data:Any?
    var var_title:String?
    var var_detail:String?
    var var_content:String?
    var var_more:String?
    var var_price:String?
    var var_discount_price:String?
    var var_name:String?
    var var_tag:String?
    var var_path:String?
    var var_select = false
    var var_hide = false
    var var_width = 0.0
    var var_originWidth = 0.0
    var var_fake = false //是否假卡片
    var var_activity = false //是否活动
    required init() {
        
    }
}
