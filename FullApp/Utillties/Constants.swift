//
//  Constatns.swift
//  FullApp
//
//  Created by juger rash on 14.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success : Bool) -> ()


//MARK: - TableViewCells
struct TableViewCells {
    static let ChannelCell = "channelCell"
}

//MARK: - Segues
struct Segues {
    static let ToLoginVC = "ToLoginVC"
    static let ToCreateAccountVC = "ToCreateAccountVC"
    static let ToUnwindSegue = "ToUnwindSegue"
    static let ToAvatarPickerVC = "ToAvatarPickerVC"
}


//MARK: - UITests

struct TestViewIDs {
    static let ChatVCID = "ChatViewID"
    static let SideMenuVCViewID = "SideMenuVCViewID"
    static let LoginVCViewID = "LoginVCViewID"
    static let CreateAccountVCViewID = "CreateAccountVCViewID"
    static let AvatarPickerVCViewID = "AvatarPickerVCViewID"
}

struct TestButtonViewIDs {
    static let SideMenuBtnViewID = "SideMenuViewID"
    static let LoginBtnViewID = "LoginBtnViewID"
    static let ExitBtnViewID = "ExitBtnViewID"
    static let SignupBtnVIewID = "SignupBtnVIewID"
    static let ExitBtnToUnwindViewID = "ExitBtnToUnwindViewID"
    static let PickAvatarBtnViewID = "PickAvatarBtnViewID"
}


//MARK: - User Defaults Keys
struct UserDefaultsKeys {
    static let AuthTokenKey = "AuthTokenKey"
    static let EmailKey = "EmailKey"
    static let IsLoggedInKey = "IsLoggedInKey"
}

//MARK: - Urls
let BaseUrl = "https://fullchatychat.herokuapp.com/v1/"

struct Urls {
    static let RegisterUserUrl = "\(BaseUrl)account/register"
    static let LoginUserUrl = "\(BaseUrl)account/login"
    static let AddUserUrl = "\(BaseUrl)user/add"
    static let FindUserByEmail = "\(BaseUrl)user/byEmail/"
}


//MARK: - Headers
struct Headers {
    static let LoginRegisterHeader = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
    static let BearerHeader = [
        "Authorization" : "Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json; charset=utf-8"
        ]
}

//MARK: - CollectionView Cell  Identifiers
struct CollectionCellIdens {
    static let AvatarCell = "AvatarCell"
}

//MARK: - Colors
struct Colors {
    static let SmackPurpleColor = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)
}

//MARK: - Notification Center
struct NotificationCenterConstants {
    static let UserDataChangedNotification = Notification.Name("UserDataChangedNotification")
}

//MARK: - Images
struct Images {
    static let MenuProfileIcon = "menuProfileIcon"
}

