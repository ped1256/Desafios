//
//  ChallengesOperations.swift
//  desafios
//
//  Created by Pedro Emanuel on 20/08/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class ChallengeOperationRequest : NSObject {
    var ref: DatabaseReference!
    var challenges: [Challenge]?
    
    func getAllChallengesFromAPI(completion: @escaping ([Challenge]) -> ()) {
        ref = Database.database().reference()
        
    }
    
    func setChallenges(){
        ref = Database.database().reference()
    }
}
