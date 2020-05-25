//
//  UserDataService.swift
//  FullApp
//
//  Created by juger rash on 20.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id : String = ""
    public private(set) var name : String = ""
    public private(set) var email : String = ""
    public private(set) var avatarName : String = ""
    public private(set) var avatarColor : String = ""

    
    func setUserData(userData : UserData) {
        self.id = userData.id
        self.name = userData.name
        self.email = userData.email
        self.avatarName = userData.avatarName
        self.avatarColor = userData.avatarColor
      }
    func setAvatarName(avatarName : String ) {
        self.avatarName = avatarName
    }
    func returnUIColor(componants : String ) -> UIColor {
        
        let scanner = Scanner(string: componants)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
       guard let rUnwrapped = r ,
        let gUnwrapped = g ,
        let bUnwrapped = b ,
        let aUnwrapped = a else { return defaultColor }
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newColor
    }
    
    func logoutUser() {
        id = ""
        name = ""
        email = ""
        avatarName = ""
        avatarColor = ""
        
        AuthService.instance.isLoggedIn = false
        AuthService.instance.authToken = ""
        AuthService.instance.userEmail = ""
        
    }
    
}
