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

    override func viewDidLoad() {
        super.viewDidLoad()
       self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
        
    }
    
    //MARK: - Actions
    @IBAction func addChannelBtnWasPressed(_ sender : UIButton) {
        
    }
    @IBAction func loginBtnWasPressed(_ sender : UIButton) {
        performSegue(withIdentifier: Segues.ToLoginVC, sender: self)
    }
    


}
