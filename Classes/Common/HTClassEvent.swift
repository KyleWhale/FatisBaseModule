//
//  HTClassEvent.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/13.
//

import UIKit

class HTClassEvent: NSObject {
    var var_target:UIResponder?
    var var_indexPath:NSIndexPath?
    var var_info:Any?
    var var_key:String?
    static func ht_eventResponder(var_responer:UIResponder?,var_target:UIResponder?,var_key:String?,var_indexPath:NSIndexPath?,var_info:Any?) -> HTClassEvent{
        let var_event = HTClassEvent()
        var_event.var_indexPath = var_indexPath
        var_event.var_info = var_info
        var_event.var_key = var_key
        var_event.var_target = var_target
        if let var_responer = var_responer{
            var_responer.next?.ht_respondEvent(var_event:var_event)
        }
        return var_event
    }
}
