//
//  AvatarCell.swift
//  FullApp
//
//  Created by juger rash on 21.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

enum AvataryType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var avatarCellImg : UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    //MARK: - Functions
    func configureCell(index : Int , avatarType : AvataryType) {
        if avatarType == AvataryType.dark {
            avatarCellImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else {
            avatarCellImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }
    
    func setupViews() {
        self.layer.cornerRadius = 7
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
    }
}
