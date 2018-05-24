//
//  CaptureChallengeViewController.swift
//  desafios
//
//  Created by Pedro Emanuel on 07/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import UIKit

class CaptureChallengeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareHomeLayout()
    }
    
    func prepareHomeLayout() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = true
        let backgroundView = BackgroundView(frame: self.view.frame)
        self.view.addSubview(backgroundView)
    }

}
