//
//  ViewController.swift
//  MVC
//
//  Created by Ankita Srivastava on 08/03/21.
//

import UIKit
//MARK:View controller class to show data on view
final class ViewController: UIViewController {
    //Whenever credentials are populated verify and show if not data is not correct
    var userData:UserModel?
    
    //MARK:Main view property to populate view
    weak var mainView:ViewMain?{
        guard  isViewLoaded else{
            print("View cannot be loaded")
            return nil        }
        return view as? ViewMain
    }
    var textObserver: NSKeyValueObservation?
    
    //MARK:View comtroller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCredentials()
        // Do any additional setup after loading the view.
    }
    
    /// Method will check reentials entered by user
    func checkCredentials() {
        mainView?.updateInfo = {[weak self](userInfo) in
            guard let self = self else{
                print("self is nil")
                return
            }
            var nameStr = ""
            var passwordStr = ""
            switch userInfo {
            case .name(name:let name):
                nameStr = name
            case .password(pass:let password):
                print(password)
                passwordStr = password
            }
            
            if !nameStr.isEmpty && !passwordStr.isEmpty{
                Utils.showToast(message: Constant.validCred, vc: self)
            }else{
                Utils.showToast(message: Constant.invalidCredentials, vc: self)
            }
        }
    }
}

