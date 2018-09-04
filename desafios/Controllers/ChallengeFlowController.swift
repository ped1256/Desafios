//
//  ChallengesFlowController.swift
//  desafios
//
//  Created by Pedro Emanuel on 11/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

protocol ChallengeFlowDelegate  {
    func selectChallenge(challengeType: ChallengeType)
}

final class ChallengeFlowController: ChallengeFlowDelegate {
    
    init(presenter: UIViewController) {
        self.presenter = presenter
    }
    
    var delegate: ChallengeFlowDelegate?
    var presenter: UIViewController
    
    var captureChallengeViewController: CaptureChallengeViewController {
        // create faker user
//        let user = User(name: "Pedro", email: "Pedro.azevedo@peixeurbano", avatar: nil, Challenges: nil, score: 1000, level: Level.low)
        let captureChallengeViewController = CaptureChallengeViewController()
        
        return captureChallengeViewController
    }
    
    func selectChallenge(challengeType: ChallengeType) {
        startChallenge(challengeType: challengeType)
    }
    
    func startChallenge(challengeType: ChallengeType){
        switch challengeType {
        case .capture:
            let navi = UINavigationController(rootViewController: self.captureChallengeViewController)
            self.presenter.present(navi, animated: true, completion: nil)
        default:
            return
        }
    }
}

