//
//  AvatarPickerVC.swift
//  FullApp
//
//  Created by juger rash on 21.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var collectionView : UICollectionView!
    @IBOutlet private weak var segmentControl : UISegmentedControl!
    
    //MARK: - Variables
    var avatarType = AvataryType.dark

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self 
    }

    //MARK: - Actions
    @IBAction func closeBtnWasPressed(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func segmentControlWasChanged(_ sender : UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        collectionView.reloadData()
    }
}

extension AvatarPickerVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellIdens.AvatarCell, for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, avatarType: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numOfColumns : CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
        }
        
        let spacesBetweenCells : CGFloat = 10
        let padding : CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1 ) * spacesBetweenCells) / numOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        dismiss(animated: true , completion: nil)
    }
    
}
