//
//  Extensions.swift
//  FullApp
//
//  Created by juger rash on 19.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import Foundation


extension String {
    var isNotEmpty : Bool {
        return !isEmpty
    }
}


extension UIViewController {
    
    func showAlert(msg : String , vc : UIViewController) {
        let alert = UIAlertController(title: "Error!", message: msg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
