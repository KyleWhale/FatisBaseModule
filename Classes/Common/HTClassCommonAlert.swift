//
//  HTClassCommonAlert.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/22.
//

import UIKit

class HTClassCommonAlert: HTClassBaseVC {
    var var_type = 0
    var var_dataSource : [String] = []
    var var_block: BLOCK_selectBlock?
    lazy var var_datePicker:UIDatePicker = {
        let var_datePicker = UIDatePicker()
        var_datePicker.datePickerMode = .date
        var_datePicker.maximumDate = Date()
        var_datePicker.isHidden = true
        if #available(iOS 13.4, *) {
            var_datePicker.preferredDatePickerStyle = .wheels
        }
        var_datePicker.overrideUserInterfaceStyle = .dark
        return var_datePicker
    }()
    
    lazy var var_pickView:UIPickerView = {
        let var_pickView = UIPickerView()
        var_pickView.delegate = self
        var_pickView.dataSource = self
        var_pickView.isHidden = true
        return var_pickView
    }()
    
    lazy var var_tableView:HTClassTableView = {
        let var_tableView = HTClassTableView(frame: .zero, style: .plain)
        var_tableView.isScrollEnabled = false
        var_tableView.backgroundColor = .black
        var_tableView.isHidden = true
        var_tableView.delegate = self
        var_tableView.dataSource = self
        return var_tableView
    }()
    
    lazy var var_headView:UIView = {
        let var_headView = UIView()
        var_headView.isHidden = true
        let var_lineView = UIView()
        var_lineView.backgroundColor = .ht_colorHex(var_rgbValue: 0x2D2F33)
        var_headView.addSubview(var_lineView)
        var_lineView.snp.remakeConstraints { make in
            make.bottom.left.right.equalTo(var_headView)
            make.height.equalTo(0.5)
        }
        return var_headView
    }()
    
    lazy var var_cancelBTN : HTClassButton = {
        let var_cancel = HTClassButton()
        var_cancel.setTitleColor(.STATIC_EC, for: .normal)
        var_cancel.setTitle(ht_LocalString("Cancel"), for: .normal)
        var_cancel.addTarget(self, action: #selector(ht_cancelAction), for: .touchUpInside)
        return var_cancel
    }()
    
    lazy var var_confirm : HTClassButton = {
        let var_cancel = HTClassButton()
        var_cancel.setTitleColor(.STATIC_EC, for: .normal)
        var_cancel.setTitle(ht_LocalString("OK"), for: .normal)
        var_cancel.addTarget(self, action: #selector(ht_okAction), for: .touchUpInside)
        return var_cancel
    }()
    
    
    override func ht_setupViews() {
        ht_addBottomView()
        var_bottomView.addSubview(var_headView)
        var_bottomView.addSubview(var_tableView)
        var_bottomView.addSubview(var_pickView)
        var_bottomView.addSubview(var_datePicker)
    }
    
    override func ht_getNewData() {
        self.var_headView.isHidden = false
        var_headView.addSubview(var_cancelBTN)
        var_headView.addSubview(var_confirm)
        if var_type == 0 {
            var_cancelBTN.setTitleColor(.ht_colorHex(var_rgbValue: 0x828386), for: .normal)
            var_bottomView.addSubview(var_cancelBTN)
            var_headView.isHidden = true
            var_tableView.isHidden = false
        } else if var_type == 1 {
            var_pickView.isHidden = false
        } else if var_type == 2 {
            var_datePicker.isHidden = false
        }
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        var_headView.snp.remakeConstraints { make in
            if !var_headView.isHidden {
                make.height.equalTo(44.auto())
                make.left.top.right.equalToSuperview()
            }
        }
        
        var_cancelBTN.snp.remakeConstraints { make in
            if var_headView.isHidden {
                make.top.equalTo(var_tableView.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(53.auto())
                make.bottom.lessThanOrEqualTo(-var_htSafeBottom)
            }else{
                make.left.equalTo(10.auto())
                make.top.bottom.equalToSuperview()
            }
        }
        
        var_confirm.snp.remakeConstraints { make in
            if !var_confirm.isHidden {
                make.right.equalTo(-10.auto())
                make.top.bottom.equalToSuperview()
            }
        }
        
        var_tableView.snp.remakeConstraints { make in
            if !var_tableView.isHidden {
                make.top.left.right.equalToSuperview()
                make.height.equalTo(53.auto() * var_dataSource.count)
                make.bottom.lessThanOrEqualTo(-var_htSafeBottom)
            }
        }
        
        var_pickView.snp.remakeConstraints { make in
            if !var_pickView.isHidden {
                make.top.equalTo(self.var_headView.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(200.auto())
                make.bottom.lessThanOrEqualTo(-var_htSafeBottom)
            }
        }
        
        var_datePicker.snp.remakeConstraints { make in
            if !var_datePicker.isHidden {
                make.top.equalTo(self.var_headView.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(200.auto())
                make.bottom.lessThanOrEqualTo(-var_htSafeBottom)
            }
        }
    }
    
    @objc func ht_cancelAction(){
        self.dismiss(animated: false)
    }
    
    @objc func ht_okAction(){
        self.dismiss(animated: false)
        if var_type == 2 {
            if let var_block = var_block {
                var_block(var_datePicker.date)
            }
        } else {
            if let var_block = var_block {
                var_block(var_dataSource[var_pickView.selectedRow(inComponent: 0)])
            }
        }
    }
    
}

extension HTClassCommonAlert : UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return var_dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return var_dataSource[row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var var_cell:HTClassCommonAlertCell? = tableView.dequeueReusableCell(withIdentifier: "HTClassCommonAlertCell") as? HTClassCommonAlertCell
        if var_cell == nil {
            var_cell =  HTClassCommonAlertCell(style: .subtitle, reuseIdentifier: "HTClassCommonAlertCell") as HTClassCommonAlertCell
        }
        var_cell?.var_title = var_dataSource[indexPath.row]
        var_cell?.ht_updateCellWithData()
        return var_cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return var_dataSource.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false)
        if let var_block = var_block {
            var_block(var_dataSource[indexPath.row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: self.var_dataSource[row],attributes: [.font:UIFont.systemFont(ofSize: 16),.foregroundColor:UIColor.white])
    }
}
