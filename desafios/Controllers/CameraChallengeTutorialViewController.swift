//
//  CameraChallengerTutorialViewController.swift
//  desafios
//
//  Created by Pedro Emanuel on 30/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class CameraChallengeTutorialViewController: UIViewController {
    var delegate: ChallengesFlowDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = BackgroundView(frame: self.view.frame)
    }
}
