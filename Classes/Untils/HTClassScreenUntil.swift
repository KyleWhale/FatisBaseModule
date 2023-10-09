//
//  HTClassScreenUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/21.
//

import Foundation

enum HTEnumScreenType {
    case htEnumPort
    case htEnumLand
    case htEnumAuto
}

public struct HTClassScreenUntil {
   static  func ht_switchScreenOrientation(var_vc: UIViewController, var_mode: HTEnumScreenType) {
       //测试
//        guard let var_myAppdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        var_myAppdelegate.var_mode = var_mode
        if #available(iOS 16.0, *) {
            let var_windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            switch var_mode {
            case .htEnumPort:
                var_windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
                break
            case .htEnumLand:
                var_windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscape))
                break
            case .htEnumAuto:
                var_windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .all))
                break
            }
            var_vc.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            switch var_mode {
            case .htEnumPort:
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                break
            case .htEnumLand:
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                break
            case .htEnumAuto:
                UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
                break
            }
        }
    }
}


