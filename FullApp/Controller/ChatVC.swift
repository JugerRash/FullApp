//
//  ChatVC.swift
//  FullApp
//
//  Created by juger rash on 13.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var sideMenuBtn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        guard let panGesture = self.revealViewController()?.panGestureRecognizer(),
            let tapGesture = self.revealViewController()?.tapGestureRecognizer() else { return }
        self.view.addGestureRecognizer(panGesture)
        self.view.addGestureRecognizer(tapGesture)
    }

}
