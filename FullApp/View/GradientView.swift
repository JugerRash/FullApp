//
//  GradientView.swift
//  FullApp
//
//  Created by juger rash on 14.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    //MARK: - Variables
    @IBInspectable var topColor : UIColor = UIColor.blue
    {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    @IBInspectable var bottomCOlor : UIColor = UIColor.white {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        let gradientView = CAGradientLayer()
        gradientView.colors = [topColor.cgColor , bottomCOlor.cgColor]
        gradientView.startPoint = CGPoint(x: 0, y: 0)
        gradientView.endPoint = CGPoint(x: 1, y: 1)
        gradientView.frame = self.bounds
        self.layer.insertSublayer(gradientView, at: 0)
    }
}
