//
//  HTClassUIViewExt.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/13.
//

import Foundation

extension UIView {
    public func ht_wRequired(var_require:Bool = true){
        self.setContentCompressionResistancePriority(var_require ? .required : .fittingSizeLevel, for: .horizontal)
        self.setContentHuggingPriority(var_require ? .required : .fittingSizeLevel, for: .horizontal)
    }
    
    public func ht_hRequired(var_require:Bool = true){
        self.setContentCompressionResistancePriority(var_require ? .required : .fittingSizeLevel, for: .vertical)
        self.setContentHuggingPriority(var_require ? .required : .fittingSizeLevel, for: .vertical)
    }
    
    public func ht_gradientColor(var_colors: [Any],var_start:CGPoint = CGPoint(x: 0, y: 0),var_end:CGPoint = CGPoint(x: 1, y: 0)) {
        layoutIfNeeded()
        var var_gradientLayer: CAGradientLayer!
        ht_removeGradientLayer()
        var_gradientLayer = CAGradientLayer()
        var_gradientLayer.frame = self.layer.bounds
        var_gradientLayer.startPoint = var_start
        var_gradientLayer.endPoint = var_end
        var_gradientLayer.colors = var_colors
        var_gradientLayer.cornerRadius = self.layer.cornerRadius
        var_gradientLayer.masksToBounds = true
        self.layer.insertSublayer(var_gradientLayer, at: 0)
        self.layer.masksToBounds = false
    }
    
    public func ht_removeGradientLayer() {
        if let var_sl = self.layer.sublayers {
            for var_layer in var_sl {
                if var_layer.isKind(of: CAGradientLayer.self) {
                    var_layer.removeFromSuperlayer()
                }
            }
        }
    }
}

extension UIStackView {
    
    func ht_removeFully(var_view: UIView) {
        removeArrangedSubview(var_view)
        var_view.removeFromSuperview()
    }
    
    func ht_removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            ht_removeFully(var_view: view)
        }
    }
    
}
