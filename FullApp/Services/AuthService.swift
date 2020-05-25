//
//  AuthService.swift
//  FullApp
//
//  Created by juger rash on 19.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    //User Defaults Variables
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: UserDefaultsKeys.IsLoggedInKey)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.IsLoggedInKey)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: UserDefaultsKeys.AuthTokenKey) as! String
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.AuthTokenKey)
        }
    }
    var userEmail : String {
        get {
            return defaults.value(forKey: UserDefaultsKeys.EmailKey) as! String
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.EmailKey)
        }
        
    }
    
    
    
    func registeUser(email : String , password : String , completion : @escaping CompletionHandler) {

        let body : [String : Any] = [
            "email" : email,
            "password" : password
        ]
        
        Alamofire.request(Urls.RegisterUserUrl, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Headers.LoginRegisterHeader).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            }else {
                completion(false)
                guard let error = response.result.error else { return }
                debugPrint(error.localizedDescription)
                return
            }
            
        }
        
    }
    
    func loginUser(email : String ,password : String , completion : @escaping CompletionHandler) {
        
        let body : [String : Any] = [
            "email" : email,
            "password" : password
        ]
        
        Alamofire.request(Urls.LoginUserUrl, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Headers.LoginRegisterHeader).responseJSON { (response) in
                
            if response.result.error == nil {
                guard let data = response.data else { completion(false)
                    return
                }
                do {
                    let json = try JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    print(self.authToken)
                    self.isLoggedIn = true
                    completion(true)
                } catch {
                    completion(false)
                    debugPrint(error.localizedDescription)
                    return
                }
                
            }else {
                completion(false)
                return
            }
            
            
        }
        
        
        
    }
    
    func createUser(name : String ,email : String ,avatarName : String ,avatarColor : String , completion : @escaping CompletionHandler) {
        
        let header = [
            "Authorization" : "Bearer \(self.authToken)",
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let body : [String : Any] = [
            "name" : name,
            "email" : email,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        
        Alamofire.request(Urls.AddUserUrl, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if let error = response.result.error {
                completion(false)
                debugPrint(error.localizedDescription)
                return
            }

            
            guard  let data = response.data else {
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let userData = try jsonDecoder.decode(UserData.self, from: data)
                UserDataService.instance.setUserData(userData: userData)
                completion(true)
            } catch {
                completion(false)
                debugPrint(error.localizedDescription)
                return
            }
        }
    }
    
    
}
