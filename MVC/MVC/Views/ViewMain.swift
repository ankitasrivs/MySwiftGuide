//
//  VIewMain.swift
//  MVC
//
//  Created by Ankita Srivastava on 08/03/21.
//

import Foundation
import UIKit
//MARK:View Controller view class
final class ViewMain:UIView{
    ///User data
    enum EnteredData{
        case name(name:String)
        case password(pass:String)
    }
    var updateInfo:((EnteredData)->Void)?
    
    //MARK:Outlets
    @IBOutlet weak var name:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var MainView:UIView!
    
    /// This method is called when a view is first displayed or when an event occurs that invalidates a visible part of the view
    /// - Parameter rect: rect of view
    override public func draw(_ rect: CGRect) {
        name.backgroundColor = .white
        password.backgroundColor = .white
        name.placeholder = Constant.namePlaceholder
        password.placeholder = Constant.passwordPlaceholder
        self.name.delegate = self
        self.password.delegate = self
    }
}

//MARK:Textfield delgates
extension ViewMain:UITextFieldDelegate{
    /// Method will be called when user try to return from one text filed
    /// - Parameter textField: textfield
    /// - Returns: should return or not
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name{
            password.becomeFirstResponder()
            updateInfo?(.name(name: textField.text ?? ""))
        }else{
            password.resignFirstResponder()
            self.MainView.endEditing(true)
            updateInfo?(.password(pass: textField.text ?? ""))
        }
        return true
    }
}
