//
//  UserAuthentication.swift
//  desafios
//
//  Created by Pedro Emanuel on 07/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class Authenticate: NSObject {
    
    let fakeUID = "h0ZRsyOIvvRJUjxpsMK1iTXfNgW2"
    var ref: DatabaseReference?
    
    func registerUser(user: UserForm, completion: @escaping (User) -> ()) {
        ref = Database.database().reference()

        Auth.auth().createUser(withEmail: user.email, password: user.password) { (response, error) in
            
            let name = user.name
            let email = user.email
            guard let uid = response?.user.uid else { return }
            
            var userInfo: [String: Any] = [:]
            userInfo["name"] = user.name
            userInfo["email"] = user.email
            userInfo["score"] = 0
            userInfo["level"] = 1
            userInfo["avatar"] = ""
            
            var challenges: [String: Any] = [:]
            challenges["challengeID"] = 0
            challenges["challengeName"] = "Procure por Copo"
            challenges["challengeImage"] = "copoImageURL"
            challenges["challengeDificult"] = 1
            challenges["challengetype"] = 1
            
            userInfo["challenges"] = [challenges]

            let user = User(name: name, email: email, avatar: nil, Challenges: nil, score: 0, level: Level.low)
            self.ref?.child("users/\(self.fakeUID)").setValue(userInfo)
            completion(user)
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (User) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            guard let uid = response?.user.uid else { return }
            
            self.getUserInfoDataBase(uid: self.fakeUID, completion: { user in
                completion(user)
            })
            
        }
    }
    
    func getUserInfoDataBase(uid: String, completion: @escaping (User) -> ()) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let usersQuery = ref?.child("users/\(uid)")
        
        usersQuery?.queryOrderedByValue().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any],
                let name = value["name"] as? String,
                let email = value["email"] as? String,
                let score = value["score"] as? Float,
                let levelNumber = value["level"] as? Int,
                //fazer imagens url virarem UIIMage
                let avatar = value["avatar"] as? String,
                let challengesValue = value["challenges"] as? [[String: Any]] else { return }

            var challengesList = [Challenge]()
            
            for challenges in challengesValue {
                guard let challengeId = challenges["challengeID"] as? Int,
                    let challengeName = challenges["challengeName"] as? String,
                    let challengeImage = challenges["challengeImage"] as? String,
                    let challengeDificult = challenges["challengeDificult"] as? Int,
                    let challengeType = challenges["challengetype"] as? Int else { return }

                let challenge = Challenge(challengeID: challengeId, challengeName: challengeName, challengeImagePath: challengeImage, challengeDificult: Difficulty(rawValue: challengeDificult), challengetype: ChallengeType(rawValue: challengeType))

                challengesList.append(challenge)
            }
            
            let user = User(name: name, email: email, avatar: nil, Challenges: challengesList, score: score, level: Level(rawValue: levelNumber)!)
            completion(user)
        }
    }
}
