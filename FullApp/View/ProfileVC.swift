//
//  ProfileVC.swift
//  FullApp
//
//  Created by juger rash on 25.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var usernameLbl : UILabel!
    @IBOutlet private weak var emailLbl : UILabel!
    @IBOutlet private weak var bgView : UIView!
    @IBOutlet private weak var userImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Actions
    @IBAction func closeBtnWasPressed(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logoutBtnWasPressed(_ sender : UIButton) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NotificationCenterConstants.UserDataChangedNotification, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Functions
    @objc func dismissView(_ tap : UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        usernameLbl.text = UserDataService.instance.name
        emailLbl.text = UserDataService.instance.email
        userImage.image = UIImage(named: UserDataService.instance.avatarName)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(componants: UserDataService.instance.avatarColor)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView(_:)))
        tap.numberOfTouchesRequired = 1
        bgView.addGestureRecognizer(tap)
        
    }
    

}
