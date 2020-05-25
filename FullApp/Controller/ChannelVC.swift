//
//  ChannelVC.swift
//  FullApp
//
//  Created by juger rash on 13.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var tableView : UITableView!
    @IBOutlet private weak var loginBtn : UIButton!
    @IBOutlet private weak var userImage : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(userDataChanged(_:)), name: NotificationCenterConstants.UserDataChangedNotification, object: nil)
    }
    
    //MARK: - Actions
    @IBAction func addChannelBtnWasPressed(_ sender : UIButton) {
        
    }
    @IBAction func loginBtnWasPressed(_ sender : UIButton) {
        performSegue(withIdentifier: Segues.ToLoginVC, sender: self)
    }
    @IBAction func prepareForUnwind(segue : UIStoryboardSegue) { }

    //MARK: - Functions
    @objc func userDataChanged(_ notif : Notification) {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(componants: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: Images.MenuProfileIcon)
            userImage.backgroundColor = UIColor.lightGray
        }
    }


}
