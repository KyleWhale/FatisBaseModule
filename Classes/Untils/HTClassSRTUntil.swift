//
//  HTClassSRTUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/21.
//

import Foundation

class HTClassSRTUntil{
    static func ht_getVideoSubtitles(var_data:Data) -> [HTClassModelMVSRT]{
        let var_string = String(data: var_data, encoding: .utf8)
        let var_nString = var_string as? NSString
        var var_srtArray:[HTClassModelMVSRT] = []
        guard let var_nString = var_nString else { return var_srtArray }
        if !var_nString.contains("\n"){
            return var_srtArray
        }
        var var_signleArray:[String] = []
        if var_nString.contains("\n\n"){
            var_signleArray = var_nString.components(separatedBy: "\n\n")
        }
        if var_signleArray.count <= 1 {
            var_signleArray = var_nString.components(separatedBy:"\r\n\r\n")
        }
        var var_resultArr:[String] = []
        var var_lastStr:String?
        for var_nowStr in var_signleArray{
            var var_addStr:String?
            if !var_nowStr.contains(ht_AsciiString("-->")) && var_lastStr != nil && var_lastStr!.contains(ht_AsciiString("-->")){
                if !var_resultArr.isEmpty{
                    var_resultArr.removeLast()
                }
                var_addStr = String(format:"%@\n%@",var_lastStr!,var_nowStr)
            }
            else if var_nowStr.contains(ht_AsciiString("-->")){
                var_addStr = var_nowStr
            }
            
            if var_addStr != nil && var_addStr!.hasPrefix("\n"){
                var_addStr = (var_addStr! as NSString).substring(from: 1)
            }
            if let var_addStr = var_addStr{
                var_resultArr.append(var_addStr)
                var_lastStr = var_nowStr
            }
        }
        
        for (var_z,var_unitStr) in var_resultArr.enumerated(){
            let var_model = HTClassModelMVSRT()
            var_model.var_index = var_z
            var var_subStr = ""
            let var_sepArr = (var_unitStr as NSString).components(separatedBy: "\n")
            var var_index = 0
            for (var_i,_) in var_sepArr.enumerated(){
                if var_i == 0 || var_i == 1{
                    let var_timeStr = var_sepArr[var_i]
                    var var_range:NSRange = (var_timeStr as NSString).range(of: ht_AsciiString(" --> "))
                    if var_range.location == NSNotFound{
                        var_range = (var_timeStr as NSString).range(of: ht_AsciiString(" -->"))
                    }
                    if var_range.location == NSNotFound{
                        var_range = (var_timeStr as NSString).range(of: ht_AsciiString("--> "))
                    }
                    if var_range.location == NSNotFound{
                        var_range = (var_timeStr as NSString).range(of: ht_AsciiString("-->"))
                    }
                    if var_range.location != NSNotFound{
                        var_index = var_i
                        let var_beganStr = (var_timeStr as NSString).substring(to: var_range.location)
                        let var_endStr = (var_timeStr as NSString).substring(from: var_range.location + var_range.length)
                        var_model.var_began = HTClassSRTUntil.ht_dealTime(var_began: var_beganStr)
                        var_model.var_end = HTClassSRTUntil.ht_dealTime(var_began: var_endStr)
                    }
                }
                else if var_i > var_index {
                    let var_timeStr = var_sepArr[var_i]
                    if var_timeStr != "\n"{
                        if var_subStr == "" {
                            var_subStr = var_timeStr
                        }else{
                            var_subStr = var_subStr + "\n" + var_timeStr
                        }
                        var_model.var_subtitle = var_subStr
                    }
                }
            }
            var_srtArray.append(var_model)
        }
        return var_srtArray
    }
    
    static func ht_dealTime(var_began:String) -> Int{
        var var_beginnum = 0.0
        var var_teim = 0.0
        if var_began.contains(":"){
            let var_arr:[String] = (var_began as NSString).components(separatedBy: ":")
            if var_arr.count > 2{
                if var_arr[2].contains(","){
                    let var_arr1:[String] = (var_arr[2] as NSString).components(separatedBy: ",")
                    if var_arr1.count == 2{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 * 60.0 + (var_arr[1] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue + (var_arr1[1] as NSString).doubleValue / 1000.0
                    }
                    else if var_arr1.count == 1{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 * 60.0 + (var_arr[1] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue
                    }
                    else {
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 * 60.0 + (var_arr[1] as NSString).doubleValue * 60.0
                    }
                }
                else if var_arr[2].contains("."){
                    let var_arr1:[String] = (var_arr[2] as NSString).components(separatedBy: ".")
                    if var_arr1.count == 2{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 * 60.0 + (var_arr[1] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue + (var_arr1[1] as NSString).doubleValue / 1000.0
                    }
                    else if var_arr1.count == 1{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 * 60.0 + (var_arr[1] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue
                    }
                    else {
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 * 60.0 + (var_arr[1] as NSString).doubleValue * 60.0
                    }
                }
            }else{
                if var_arr[1].contains(","){
                    let var_arr1:[String] = (var_arr[1] as NSString).components(separatedBy: ",")
                    if var_arr1.count == 2{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue + (var_arr1[1] as NSString).doubleValue / 1000.0
                    }
                    else if var_arr1.count == 1{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue
                    }
                    else {
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0
                    }
                }
                else if var_arr[1].contains("."){
                    let var_arr1:[String] = (var_arr[1] as NSString).components(separatedBy: ".")
                    if var_arr1.count == 2{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue + (var_arr1[1] as NSString).doubleValue / 1000.0
                    }
                    else if var_arr1.count == 1{
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0 + (var_arr1[0] as NSString).doubleValue
                    }
                    else {
                        var_teim = (var_arr[0] as NSString).doubleValue * 60.0
                    }
                }
            }
        }
        var_beginnum = var_teim * 1000.0
        return Int(var_beginnum)
    }
}
