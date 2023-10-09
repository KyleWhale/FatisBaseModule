//
//  FoundationExtension.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/12.
//

import Foundation
import UIKit

extension UIColor {

    ///0x111218
    static let STATIC_bg = UIColor.ht_colorHex(var_rgbValue: 0x111218)
    ///0xECECEC
    static let STATIC_EC = UIColor.ht_colorHex(var_rgbValue: 0xECECEC)
    ///STATIC_22
    static let STATIC_22 = UIColor.ht_colorHex(var_rgbValue: 0x222222)
    ///STATIC_23
    static let STATIC_23 = UIColor.ht_colorHex(var_rgbValue: 0x23252A)
    ///STATIC_82
    static let STATIC_82 = UIColor.ht_colorHex(var_rgbValue: 0x828386)
    ///STATIC_33
    static let STATIC_33 = UIColor.ht_colorHex(var_rgbValue: 0x333333)
    ///STATIC_66
    static let STATIC_66 = UIColor.ht_colorHex(var_rgbValue: 0x666666)
    ///STATIC_99
    static let STATIC_99 = UIColor.ht_colorHex(var_rgbValue: 0x999999)
    ///STATIC_96
    static let STATIC_96 = UIColor.ht_colorHex(var_rgbValue: 0x969696)
    ///STATIC_1A
    static let STATIC_1A = UIColor.ht_colorHex(var_rgbValue: 0x1A1C21)
    ///STATIC_6D
    static let STATIC_6D = UIColor.ht_colorHex(var_rgbValue: 0x6D717D)
    ///STATIC_CC
    static let STATIC_CC = UIColor.ht_colorHex(var_rgbValue: 0xCCCED6)
    ///STATIC_00
    static let STATIC_00 = UIColor.ht_colorHex(var_rgbValue: 0x000000)
    ///STATIC_BLUE
    static let STATIC_BLUE = UIColor.ht_colorHex(var_rgbValue: 0x3CDEF4)
    
    static let STATIC_2325 = UIColor.ht_colorHex(var_rgbValue: 0x23252A)
    
    func ht_imageWithColor() -> UIImage {
        let var_rect: CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(var_rect.size)
        
        let var_context = UIGraphicsGetCurrentContext()
        var_context?.setFillColor(self.cgColor)
        var_context?.fill(var_rect)
        
        let var_image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return var_image
    }

    static func ht_colorHex(var_rgbValue: Int) -> (UIColor) {
        return ht_colorHex(var_rgbValue: var_rgbValue, var_alpah: 1)
    }
    
    static func ht_colorHex(var_rgbValue: Int, var_alpah : CGFloat) -> (UIColor) {
        return UIColor(red: ((CGFloat)((var_rgbValue & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((var_rgbValue & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(var_rgbValue & 0xFF)) / 255.0,alpha: var_alpah)
    }
}
