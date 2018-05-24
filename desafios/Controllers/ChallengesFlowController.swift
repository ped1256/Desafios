//
//  ChallengesFlowController.swift
//  desafios
//
//  Created by Pedro Emanuel on 11/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation

protocol ChallengesFlowDelegate {
    func selectChallenge(challengeType: ChallengeType)
}

class ChallengesFlowController: ChallengesFlowDelegate {
    
    var delegate: ChallengesFlowDelegate?
    
    var captureChallengeViewController: CaptureChallengeViewController {
        // create faker user
        let user = User(name: "Pedro", email: "Pedro.azevedo@peixeurbano", avatar: nil, Challenges: nil, score: 1000)
        let captureChallengeViewController = CaptureChallengeViewController()
        return captureChallengeViewController
    }
    
    func selectChallenge(challengeType: ChallengeType) {
        
    }
}

