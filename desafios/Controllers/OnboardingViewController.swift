//
//  ViewController.swift
//  desafios
//
//  Created by Pedro Emanuel on 17/04/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class CameraOnboardingViewController: UIViewController {

    var backgroundView: UIView?
    var cameraImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildBackground()
        buildCameraImageView()
        buildMessagetextelabel()
        buildConfirmAndDeclinebutton()
        
    }
    
    func buildBackground(){
        self.navigationController?.navigationBar.isHidden = true
        self.backgroundView = UIView(frame: self.view.frame)
        guard let backgroundView = self.backgroundView else { return }
        
        let gradient = CAGradientLayer()
        
        gradient.frame = backgroundView.bounds
        
        let topColor = #colorLiteral(red: 0.1857930523, green: 0.4457156502, blue: 1, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.3337075006, green: 0.7861080266, blue: 0.1144733785, alpha: 1)
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        
        backgroundView.layer.insertSublayer(gradient, at: 1)
        backgroundView.frame = self.view.frame
        self.view.addSubview(backgroundView)
        
    }
    
    func buildCameraImageView(){
        let cameraImageView = UIImageView()
        self.view.addSubview(cameraImageView)
        cameraImageView.image = #imageLiteral(resourceName: "device-camera-icon")
        
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        cameraImageView.widthAnchor.constraint(equalToConstant: 136).isActive = true
        cameraImageView.heightAnchor.constraint(equalToConstant: 136).isActive = true
        cameraImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        cameraImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.cameraImageView = cameraImageView
    }
    
    func buildMessagetextelabel() {
        let messageLabel = UILabel()
        self.view.addSubview(messageLabel)
        messageLabel.text = "Você precisa usar a camera para identificar os elementos"
        messageLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.boldSystemFont(ofSize: 24)
        messageLabel.numberOfLines = 3
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -59).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.cameraImageView.bottomAnchor, constant: 50).isActive = true
        
        
    }
    
    func buildConfirmAndDeclinebutton() {
        let confirmButton: UIButton = UIButton()
        let width = self.view.frame.width / 2

        confirmButton.backgroundColor =  #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        confirmButton.setTitle("Permitir", for: .normal)
        confirmButton.setTitleColor(#colorLiteral(red: 0.3098039216, green: 0.4156862745, blue: 0.5411764706, alpha: 1), for: .highlighted)
        confirmButton.addTarget(self, action: #selector(confirmButtonAction(_:)), for: .touchUpInside)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubview(confirmButton)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let declineButton: UIButton = UIButton()
        declineButton.backgroundColor = #colorLiteral(red: 0.3098039216, green: 0.4156862745, blue: 0.5411764706, alpha: 1)
        declineButton.setTitle("Negar", for: .normal)
        declineButton.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), for: .highlighted)
        declineButton.addTarget(self, action: #selector(declineButtonAction(_:)), for: .touchUpInside)
        declineButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubview(declineButton)
        
        declineButton.translatesAutoresizingMaskIntoConstraints = false
        declineButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        declineButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        declineButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        declineButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    @objc func confirmButtonAction(_ sender: Any) {
        UserRequestAuthorizations.requestCameraAuthorization()
        if UserRequestAuthorizations.userIsAuthenticated() {
            // load home
        } else {
            let loginOnboardingViewController = LoginOnboardingViewController()
            self.navigationController?.pushViewController(loginOnboardingViewController, animated: true)
        }
        
    }
    
    @objc func declineButtonAction(_ sender: Any) {
        
    }

}

