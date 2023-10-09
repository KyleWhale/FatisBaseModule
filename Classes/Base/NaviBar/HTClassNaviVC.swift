//
//  HTClassNaviVC.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit

class HTClassNaviVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15.0,*) {
            let var_barApp = UINavigationBarAppearance()
            var_barApp.backgroundEffect = nil
            var_barApp.backgroundColor = UIColor.ht_colorHex(var_rgbValue: 0x1A1C21)
            var_barApp.shadowColor = nil;
            var_barApp.shadowImage = UIImage()
            var_barApp.titleTextAttributes = [.foregroundColor: UIColor.white ,.font : UIFont.systemFont(ofSize: 18, weight: .bold)]
            self.navigationBar.standardAppearance = var_barApp
            self.navigationBar.scrollEdgeAppearance = var_barApp
        } else {
            self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ,.font : UIFont.systemFont(ofSize: 18, weight: .bold)]
            self.navigationBar.barTintColor = UIColor.ht_colorHex(var_rgbValue: 0x1A1C21)
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        }
        self.delegate = self
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.navigationController?.topViewController
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension HTClassNaviVC:UINavigationControllerDelegate,UIGestureRecognizerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        var var_noNav = false
        if viewController is HTClassBaseVC {
            let var_baseVC:HTClassBaseVC = viewController as! HTClassBaseVC
            self.navigationBar.isTranslucent = false
            if var_baseVC.ht_customNaviType() == .htEnumHide {
                var_noNav = true
            }else{
                if #available(iOS 15.0,*) {
                    self.navigationBar.standardAppearance.backgroundColor = var_baseVC.ht_customNaviColor()
                    self.navigationBar.scrollEdgeAppearance?.backgroundColor = var_baseVC.ht_customNaviColor()
                } else {
                    self.navigationBar.barTintColor = var_baseVC.ht_customNaviColor()
                }
            }
            self.interactivePopGestureRecognizer?.delegate = self
            self.setNavigationBarHidden(var_noNav, animated: true)
        }  else{
            if #available(iOS 15.0,*) {
                self.navigationBar.standardAppearance.backgroundColor = .white
                self.navigationBar.scrollEdgeAppearance?.backgroundColor = .white
            } else {
                self.navigationBar.barTintColor = .white
            }
            self.interactivePopGestureRecognizer?.delegate = self
            self.setNavigationBarHidden(false, animated: true)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return self.children.count > 1
    }
}
