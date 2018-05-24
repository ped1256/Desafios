//
//  UserAuthentication.swift
//  desafios
//
//  Created by Pedro Emanuel on 07/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import FirebaseAuth

class Authenticate: NSObject {

    static func registerUser(user: UserForm, completion: @escaping (User) -> ()) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (response, error) in
        
            var name = "undefined"
            // tratar erros aqui..
            guard let email = response?.email else { return }
            
            if let nameData = response?.displayName {
                name = nameData
            }
            
            let user = User(name: name, email: email, avatar: nil, Challenges: nil, score: nil)
            completion(user)
            
        }
    }
    
    static func loginUser(email: String, password: String, completion: @escaping (User) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            var name = "undefined"
            // tratar erros aqui..
            guard let email = response?.email else { return }
            if let nameData = response?.displayName {
                name = nameData
            }
            let user = User(name: name, email: email, avatar: nil, Challenges: nil, score: nil)
            completion(user)
        }
    }
}
