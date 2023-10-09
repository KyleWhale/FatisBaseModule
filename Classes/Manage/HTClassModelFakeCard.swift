//
//  HTClassModelFakeCard.swift
//  ProjectSwift
//
//  Created by 李雪健 on 2023/8/23.
//

import Foundation
import UIKit

class HTClassModelFakeCard: HTClassModelHandJson {
    
    // 周期 30代表月 7代表周 365代表年
    var var_count:Int = 0
    // 符号$
    var var_symbol:String = ""
    // 折扣价 支付按钮用的价格
    var var_discount_price:String = ""
    // 折扣价 商品显示用的价格
    var var_commodity_price:String = ""
    // 原价
    var var_original_price:String = ""
    // 提示文案
    var var_hint:String = ""
    // 是否家庭数据 自己赋值的
    var var_family: Bool = false
    // 是否活动数据 自己赋值的
    var var_activity: Bool = false
    
    func ht_product() -> String {
        if var_count == 7 {
            return var_family ? ht_AsciiString("fw") : ht_AsciiString("week")
        } else if var_count == 30 {
            return var_family ? ht_AsciiString("fm") : ht_AsciiString("month")
        } else if var_count == 365 {
            return var_family ? ht_AsciiString("fy") : ht_AsciiString("year")
        }
        return ""
    }
    
    override func mapping(mapper: HelpingMapper) {
        mapper <<< self.var_count <-- ht_AsciiString("c1")
        mapper <<< self.var_symbol <-- ht_AsciiString("d1")
        mapper <<< self.var_discount_price <-- ht_AsciiString("h1")
        mapper <<< self.var_commodity_price <-- ht_AsciiString("h2")
        mapper <<< self.var_original_price <-- ht_AsciiString("y1")
        mapper <<< self.var_hint <-- ht_AsciiString("t1")
    }
}
