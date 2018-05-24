//
//  BackgroungView.swift
//  desafios
//
//  Created by Pedro Emanuel on 17/04/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class BackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        let bg = UIView(frame: frame)
        
        let gradient = CAGradientLayer()
        gradient.frame = bg.bounds
        
        let topColor = #colorLiteral(red: 0.1857930523, green: 0.4457156502, blue: 1, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.3337075006, green: 0.7861080266, blue: 0.1144733785, alpha: 1)
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
