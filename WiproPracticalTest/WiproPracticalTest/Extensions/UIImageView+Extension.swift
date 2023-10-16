//
//  UIImageView+Extension.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    ///Use this method for set image in UIImageView
    func setImage(with strURL: String?) {
        
        guard let strURL = strURL, let imageURL = URL(string: strURL) else {
            return
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = self.bounds
        activityIndicator.startAnimating()
        
        self.addSubview(activityIndicator)
        sd_setImage(
            with: imageURL,
            placeholderImage: nil //UIImage(assetIdentifier: .placeHolder)
        ) { image, error, catchType, url in
            
            activityIndicator.removeFromSuperview()
        }
    }
}
