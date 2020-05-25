//
//  CreateAccountVC.swift
//  FullApp
//
//  Created by juger rash on 16.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var usernameTxt : UITextField!
    @IBOutlet private weak var emailTxt : UITextField!
    @IBOutlet private weak var passwordTxt : UITextField!
    @IBOutlet private weak var avatarImage : UIImageView!
    @IBOutlet private weak var spinner : UIActivityIndicatorView!
    
    //MARK: - Variables && Constants
    var avatarName : String = "profileDefault"
    var avatarColor : String = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
                   avatarImage.image = UIImage(named: UserDataService.instance.avatarName)
                   avatarName = UserDataService.instance.avatarName
               }
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            avatarImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                avatarImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    //MARK: - Actions
    @IBAction func createAccountBtnWasPressed(_ sender : UIButton) {
        
        guard let email = emailTxt.text , email.isNotEmpty ,
            let password = passwordTxt.text , password.isNotEmpty,
            let name = usernameTxt.text, name.isNotEmpty else  {
                showAlert(msg: "Please fill the fields above.", vc: self)
                return
        }
        spinner.startAnimating()
        let lowerCaseEmail = email.lowercased()
        AuthService.instance.registeUser(email: lowerCaseEmail, password: password) { (success) in
            if success {
                print("User registered!")
                AuthService.instance.loginUser(email: lowerCaseEmail, password: password) { (success) in
                    if success {
                        print("User logged in successfully")
                        AuthService.instance.createUser(name: name, email: lowerCaseEmail, avatarName: self.avatarName, avatarColor: self.avatarColor) { (success) in
                            if success {
                                print("User added successfully.")
                                self.spinner.stopAnimating()
                                NotificationCenter.default.post(name: NotificationCenterConstants.UserDataChangedNotification, object: nil)
                                self.performSegue(withIdentifier: Segues.ToUnwindSegue, sender: self)
                            } else {
                                self.showAlert(msg: "Failed to add user", vc: self)
                            }
                        }
                    }else {
                        self.showAlert(msg: "Failed to login user.", vc: self)
                    }
                }
            }else {
                self.showAlert(msg: "Failed to register a new user.", vc: self)
            }
        }
        
    }
    
    @IBAction func exitBtnWasPressed(_ sender : UIButton) {
        performSegue(withIdentifier: Segues.ToUnwindSegue, sender: self)
    }
    
    @IBAction func pickAvatarBtnWasPressed(_ sender : UIButton) {
        performSegue(withIdentifier: Segues.ToAvatarPickerVC, sender: self)
    }
    
    @IBAction func changeBGColorBtnWasPressed(_ Sender : UIButton) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.avatarImage.backgroundColor = self.bgColor
        }
    }
    
    //MARK: - Functions
    
    func setupViews() {
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : Colors.SmackPurpleColor])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : Colors.SmackPurpleColor])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : Colors.SmackPurpleColor])
        
    }


}
