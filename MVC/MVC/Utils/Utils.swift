//
//  Utils.swift
//  MVC
//
//  Created by Ankita Srivastava on 08/03/21.
//

import UIKit
class Utils{
    
    /// Method will be called to show toast on screen
    /// - Parameter message:  message string to be shown on screen
 static  func showToast(message:String,vc:UIViewController){
        let alert = UIAlertController(title: Constant.alert, message: message, preferredStyle: .alert)
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        vc.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            alert.dismiss(animated: true)
        }
    }
}
