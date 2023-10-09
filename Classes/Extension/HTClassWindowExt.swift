//
//  UIKitExtension.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/12.
//

import Foundation

extension UIWindow {
    static var var_key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}


extension UIDevice {
   var var_modelName: String {
      var var_systemInfo = utsname()
      uname(&var_systemInfo)
      let var_machineMirror = Mirror(reflecting: var_systemInfo.machine)
      let var_identifier = var_machineMirror.children.reduce("") { identifier, element in
         guard let value = element.value as? Int8, value != 0 else { return identifier }
         return identifier + String(UnicodeScalar(UInt8(value)))
      }
       return var_identifier
   }
}
