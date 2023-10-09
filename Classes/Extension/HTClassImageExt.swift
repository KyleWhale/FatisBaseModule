//
//  HTClassImageExt.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/19.
//

import Foundation

extension UIImage {
        
    func ht_compressImageMidToImg(var_maxLength: Int) -> UIImage {
        let var_data = self.ht_compressImage(var_maxLength: var_maxLength)
        if let var_img = UIImage(data: var_data){
            return var_img
        }
        return self
    }

    func ht_compressImage(var_maxLength: Int) -> Data {
        // let tempMaxLength: Int = maxLength / 8
        let var_tempMaxLength: Int = var_maxLength
        var var_compression: CGFloat = 1
        guard var var_data = self.jpegData(compressionQuality: var_compression), var_data.count > var_tempMaxLength else { return self.jpegData(compressionQuality: var_compression)! }
        var max: CGFloat = 1
        var min: CGFloat = 0
        for _ in 0..<6 {
            var_compression = (max + min) / 2
            var_data = self.jpegData(compressionQuality: var_compression)!
            if CGFloat(var_data.count) < CGFloat(var_tempMaxLength) * 0.9 {
                min = var_compression
            } else if var_data.count > var_tempMaxLength {
                max = var_compression
            } else {
                break
            }
        }
        var var_resultImage: UIImage = UIImage(data: var_data)!
        if var_data.count < var_tempMaxLength { return var_data }
        var var_lastDataLength: Int = 0
        while var_data.count > var_tempMaxLength && var_data.count != var_lastDataLength {
            var_lastDataLength = var_data.count
            let var_ratio: CGFloat = CGFloat(var_tempMaxLength) / CGFloat(var_data.count)
            let var_size: CGSize = CGSize(width: Int(var_resultImage.size.width * sqrt(var_ratio)),
                                      height: Int(var_resultImage.size.height * sqrt(var_ratio)))
            UIGraphicsBeginImageContext(var_size)
            var_resultImage.draw(in: CGRect(x: 0, y: 0, width: var_size.width, height: var_size.height))
            var_resultImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            var_data = var_resultImage.jpegData(compressionQuality: var_compression)!
        }
        return var_data
    }
}
