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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - Actions
    @IBAction func exitBtnWasPressed(_ sender : UIButton) {
     dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtnWasPressed(_ sender : UIButton) {
        
    }
    
    @IBAction func signupBtnWasPressed(_ sender : UIButton) {
        
    }

}
