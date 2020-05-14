//
//  ChannelVC.swift
//  FullApp
//
//  Created by juger rash on 13.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
    }

}
