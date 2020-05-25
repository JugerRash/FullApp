//
//  LoginVC.swift
//  FullApp
//
//  Created by juger rash on 14.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var usernameTxt : UITextField!
    @IBOutlet private weak var passwordTxt : UITextField!
    @IBOutlet private weak var spinner : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - Actions
    @IBAction func exitBtnWasPressed(_ sender : UIButton) {
     dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtnWasPressed(_ sender : UIButton) {
        spinner.startAnimating()
        guard let email = usernameTxt.text , email.isNotEmpty ,
            let password = passwordTxt.text , password.isNotEmpty else {
                spinner.stopAnimating()
                showAlert(msg: "Please fill all fields above.", vc: self)
                return
        }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail { (success) in
                    if success {
                        self.spinner.stopAnimating()
                        NotificationCenter.default.post(name: NotificationCenterConstants.UserDataChangedNotification, object: nil)
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        self.spinner.stopAnimating()
                        self.showAlert(msg: "Failed to logi", vc: self)
                    }
                }
            } else {
                self.showAlert(msg: "Failed to login.", vc: self)
                self.spinner.stopAnimating()
                return
            }
        }
        
    }
    
    @IBAction func signupBtnWasPressed(_ sender : UIButton) {
        performSegue(withIdentifier: Segues.ToCreateAccountVC, sender: self)
    }

}
