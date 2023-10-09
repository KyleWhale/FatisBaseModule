//
//  HTClassBaseVC.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit

enum HTEnumNaviType {
    case htEnumNormal
    case htEnumHide
    case htEnumCustom
}

class HTClassBaseVC: UIViewController {
    var var_point_source:String = ""
    var var_point_type:String = ""
    lazy var var_bottomView : UIView = {
        let var_bottom = UIView()
        var_bottom.backgroundColor = .STATIC_00
        return var_bottom
    }()
    
    lazy var var_scrollView:UIScrollView = {
        let var_scrollView = UIScrollView()
        var_scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        var_scrollView.contentInsetAdjustmentBehavior = .never
        return var_scrollView
    }()
    
    lazy var var_scrollContainView:HTClassContentView = {
        let var_scrollContainView = HTClassContentView()
        return var_scrollContainView
    }()
    
    lazy var var_scrollStackView:UIStackView = {
        let var_scrollStackView = UIStackView()
        var_scrollStackView.axis = .vertical
        return var_scrollStackView
    }()
    
    open func ht_addBottomView (){
        view.backgroundColor = .ht_colorHex(var_rgbValue: 0x000000, var_alpah: 0.3)
        view.addSubview(var_bottomView)
        var_bottomView.snp.remakeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    open func ht_addScrollAction(){
        view.addSubview(var_scrollView)
        var_scrollView.addSubview(var_scrollContainView)
        var_scrollContainView.addSubview(var_scrollStackView)
        var_scrollView.snp.remakeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        var_scrollContainView.snp.remakeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        var_scrollStackView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .STATIC_bg
        ht_setupViews()
        ht_setupNavigation()
        ht_bindViewModel()
        ht_getNewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ht_getWillData()
    }
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    open func ht_setupViews(){
        
    }
    open func ht_bindViewModel(){
        
    }
    open func ht_getNewData(){
        
    }
    open func ht_setupNavigation(){
        ht_customBack(var_back: "ic_back")
    }
    open func ht_getWillData(){
        
    }
    
    open func ht_customNaviColor() -> UIColor {
        return .STATIC_1A
    }
    
    open func ht_customNaviType() -> HTEnumNaviType {
        return .htEnumNormal
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
}

extension UIViewController {
    public func ht_customBack(var_back:String,var_force:Bool = false){
        guard let var_navi = self.navigationController else {
            return
        }
        guard var_navi.viewControllers.count > 1 || var_force else{
            return
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: var_back)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(ht_backAction))
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    @objc open func ht_backAction(){
        let var_array = self.navigationController?.viewControllers
        if let var_array = var_array {
            if 1 <= var_array.count && 0 < var_array.firstIndex(of: self)! {
                self.navigationController?.popViewController(animated: true)
            }else{
                self.dismiss(animated: true, completion: nil)
            }
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
