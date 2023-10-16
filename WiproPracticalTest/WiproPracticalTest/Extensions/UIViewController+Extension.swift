//
//  UIViewController+Extension.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ strTitle: String, strMessage: String) {
        
        let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: .alert)
        
        alertController.addAction(
            UIAlertAction(title: "Okay", style: .default)
        )
        present(alertController, animated: true)
    }
}
