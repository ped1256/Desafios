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
        self.view.backgroundColor = .white
        let backgroundViewWithAnimate = BackgroundViewWithAnimate(frame: self.view.frame)
        self.backgroundView = backgroundViewWithAnimate
        self.view.addSubview(backgroundViewWithAnimate)
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
        messageLabel.textColor = #colorLiteral(red: 0.3098039216, green: 0.4156862745, blue: 0.5411764706, alpha: 1)
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
        let loginOnboardingViewController = LoginOnboardingViewController()
        let navi = UINavigationController(rootViewController: loginOnboardingViewController)
        
        self.present(navi, animated: true, completion: nil)
    }
    
    @objc func declineButtonAction(_ sender: Any) {
        
    }
    
}
