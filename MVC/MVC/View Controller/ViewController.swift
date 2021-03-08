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
        getCredentials()
        userData = UserModel()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        userData = nil
    }
    
    /// Method will check reentials entered by user
    private func getCredentials() {
        mainView?.updateInfo = {[weak self](userInfo) in
            guard let self = self else{
                print("self is nil")
                return
            }
            switch userInfo {
            case .name(name:let name):
                self.userData?
                    .userName = name
            case .password(pass:let password):
                print(password)
                self.userData?.passcode = password
            }
            self.checkCredentials()
        }
    }
    
    /// Method will check credentials to show pop up
    private func checkCredentials(){
        if (!(userData?.userName?.isEmpty ?? false) && userData?.userName != nil ) && (!(userData?.passcode?.isEmpty ?? false) && userData?.passcode != nil){
            print(userData?.userName)
            print(userData?.passcode)
            Utils.showToast(message: Constant.validCred, vc: self)
        }else{
            Utils.showToast(message: Constant.invalidCredentials, vc: self)
        }
    }
}

