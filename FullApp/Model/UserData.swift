//
//  UserData.swift
//  FullApp
//
//  Created by juger rash on 20.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import Foundation


struct UserData : Codable {
    
    
    var id : String
    var name : String
    var email : String
    var avatarName : String
    var avatarColor : String
    var v : Int

    enum CodingKeys : String , CodingKey {
        case id = "_id"
        case name
        case email
        case avatarName
        case avatarColor
        case v = "__v"
    }
}
