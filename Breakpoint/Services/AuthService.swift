//
//  AuthService.swift
//  Breakpoint
//
//  Created by Kadeem Palacios on 4/26/18.
//  Copyright © 2018 Kadeem Palacios. All rights reserved.
//

import Foundation
import Firebase
import FBSDKLoginKit

class AuthService {

    static let instance = AuthService()
    
    static func isLoggedIn() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        }
        else if FBSDKAccessToken.current() != nil {
            return true
        }
        return false
    }

    func registerUser(withEmail email:String, andPassword password:String, completion: @escaping (_ status:Bool,_ error:Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                completion(false, error)
                return
            }
            let userData = ["provider":user.providerID, "email":user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            completion(true, nil)
        }
    }

    func loginUser(withEmail email:String, andPassword password:String, completion: @escaping (_ status:Bool,_ error:Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }
}
