//
//  CircledImageView.swift
//  FullApp
//
//  Created by juger rash on 22.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

@IBDesignable
class CircledImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViews()
    }
    
    func setupViews() {
        self.layer.cornerRadius = self.bounds.width / 2
    }
}
