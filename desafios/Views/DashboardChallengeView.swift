//
//  ChallengersView.swift
//  desafios
//
//  Created by Pedro Emanuel on 25/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class DashboardChallengeView: UIView {
    
    var image: UIImage? {
        didSet{
            updateUI()
        }
    }
    
    var imageChallenge = UIImageView()
    
    var challengeType: ChallengeType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addChallengeBox()
        addImageChallenge()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func addChallengeBox() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }
    
    func addImageChallenge() {
        self.addSubview(imageChallenge)
        imageChallenge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageChallenge.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageChallenge.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
    func updateUI() {
        self.imageChallenge.image = image
    }
}
