//
//  LoginViewController.swift
//  desafios
//
//  Created by Pedro Emanuel on 17/04/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class LoginOnboardingViewController: UIViewController {
    
    var backgroundView: UIView?
    var loginButton: UIButton?
    var registerButton = UIButton()
    var sampleMask = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildBackground()
        buildTitleLabel()
        buildLoginAndRegisterbutton()
        buildLoginFacebookButton()
    }
    
    func buildBackground() {
        
        self.navigationController?.navigationBar.isHidden = true
        let backgroundView = BackgroundView(frame: self.view.frame)
        self.view.addSubview(backgroundView)
        self.backgroundView = backgroundView
    }
    
    func buildTitleLabel(){
        let label = UILabel()
        self.view.addSubview(label)
        
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Faça login para continuar"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 17).isActive = true
        label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -17).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 280).isActive = true
    }
    
    func buildLoginAndRegisterbutton() {
        let loginButton: UIButton = UIButton()
        let width = self.view.frame.width / 2
        
        loginButton.backgroundColor =  #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(#colorLiteral(red: 0.3098039216, green: 0.4156862745, blue: 0.5411764706, alpha: 1), for: .highlighted)
        loginButton.addTarget(self, action: #selector(showLoginViewController(_:)), for: .touchUpInside)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubview(loginButton)
        self.loginButton = loginButton
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let registerButton: UIButton = UIButton()
        registerButton.backgroundColor = #colorLiteral(red: 0.3098039216, green: 0.4156862745, blue: 0.5411764706, alpha: 1)
        registerButton.setTitle("Cadastrar-se", for: .normal)
        registerButton.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), for: .highlighted)
        registerButton.addTarget(self, action: #selector(showFormRegisterViewController(_:)), for: .touchUpInside)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubview(registerButton)
        self.registerButton = registerButton
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    func buildLoginFacebookButton(){
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "log_in_with_facebook button")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 290).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

    }
    
    @objc func showFormRegisterViewController(_ sender: Any) {
        let formViewController = FormViewController()
        formViewController.formType = .register
        formViewController.modalPresentationStyle = .overCurrentContext
        self.present(formViewController, animated: true, completion: nil)
        
    }

    // vou voltar pra arrumar esses códigos duplicados
    @objc func showLoginViewController(_ sender: Any){
        let formViewController = FormViewController()
        formViewController.formType = .login
        formViewController.modalPresentationStyle = .overCurrentContext
        self.present(formViewController, animated: true, completion: nil)
        
    }
    
}
