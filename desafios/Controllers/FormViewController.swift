//
//  FormViewController.swift
//  desafios
//
//  Created by Pedro Emanuel on 17/04/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit
import FirebaseAuth

enum FormType {
    case register
    case login
}

class FormViewController: UIViewController {
    
    var modalView = UIView()
    var formType: FormType = .login
    var fieldTypes: [FormCellType] = [.name, .email, .password]
    var user: User?
    var fieldNameLabel = UILabel()
    var fieldNameTextField = UITextField()
    var fieldEmailLabel = UILabel()
    var fieldEmailTextField = UITextField()
    var fieldPasswordLabel = UILabel()
    var fieldPasswordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if formType == .login {
            fieldTypes = [.email, .password]
        }
        
        buildbackground()
        buildModalView()
        buildForm()
        buildActionButton()
    }
    
    func buildbackground() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.view.isOpaque = true
    }
    
    func buildModalView(){
        modalView.backgroundColor = UIColor.white
        modalView.clipsToBounds = true
        modalView.layer.cornerRadius = 20
        self.view.addSubview(modalView)
       
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        modalView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 52).isActive = true
        modalView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -52).isActive = true
        modalView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 21).isActive = true
        modalView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -21).isActive = true
        
        
        let closeButton = UIButton()
        modalView.addSubview(closeButton)
        closeButton.setImage(#imageLiteral(resourceName: "Grey_close"), for: .normal)
        closeButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
        closeButton.rightAnchor.constraint(equalTo: modalView.rightAnchor, constant: -21).isActive = true
        closeButton.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 21).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = formType == .login ? "Entrar" : "Cadastrar-se"
        titleLabel.textColor = #colorLiteral(red: 0.2196078431, green: 0.6156862745, blue: 0.9137254902, alpha: 1)
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        modalView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: modalView.leftAnchor, constant: 21).isActive = true
        titleLabel.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 21).isActive = true
        
        
    }
    
    func buildForm() {
        for fieldType in fieldTypes  {
            switch fieldType {
            case .name:
                self.modalView.addSubview(fieldNameLabel)
                fieldNameLabel.text = "Nome:"
                fieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
                fieldNameLabel.font = UIFont.systemFont(ofSize: 20)
                fieldNameLabel.leftAnchor.constraint(equalTo: self.modalView.leftAnchor, constant: 21).isActive = true
                fieldNameLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
                fieldNameLabel.topAnchor.constraint(equalTo: self.modalView.topAnchor, constant: 140).isActive = true
                
                self.modalView.addSubview(fieldNameTextField)
                fieldNameTextField.translatesAutoresizingMaskIntoConstraints = false
                fieldNameTextField.font = UIFont.systemFont(ofSize: 19)
                fieldNameTextField.leftAnchor.constraint(equalTo: fieldNameLabel.rightAnchor).isActive = true
                fieldNameTextField.rightAnchor.constraint(equalTo: self.modalView.rightAnchor, constant: -21).isActive = true
                fieldNameTextField.bottomAnchor.constraint(equalTo: fieldNameLabel.bottomAnchor, constant: 0).isActive = true
                fieldNameTextField.topAnchor.constraint(equalTo: fieldNameLabel.topAnchor, constant: 0).isActive = true

                buildSeparatorLine(for: fieldNameLabel)
                
            case .email:
                self.modalView.addSubview(fieldEmailLabel)
                fieldEmailLabel.text = "E-mail:"
                fieldEmailLabel.translatesAutoresizingMaskIntoConstraints = false
                fieldEmailLabel.font = UIFont.systemFont(ofSize: 20)
                fieldEmailLabel.leftAnchor.constraint(equalTo: self.modalView.leftAnchor, constant: 21).isActive = true
                fieldEmailLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
                
                
                self.modalView.addSubview(fieldEmailTextField)
                fieldEmailTextField.translatesAutoresizingMaskIntoConstraints = false
                fieldEmailTextField.font = UIFont.systemFont(ofSize: 19)
                fieldEmailTextField.leftAnchor.constraint(equalTo: fieldEmailLabel.rightAnchor).isActive = true
                fieldEmailTextField.rightAnchor.constraint(equalTo: self.modalView.rightAnchor, constant: -21).isActive = true
                fieldEmailTextField.bottomAnchor.constraint(equalTo: fieldEmailLabel.bottomAnchor, constant: 0).isActive = true
                
                if formType == .login {
                    fieldEmailLabel.topAnchor.constraint(equalTo: self.modalView.topAnchor, constant: 140).isActive = true
                    fieldEmailTextField.topAnchor.constraint(equalTo: self.modalView.topAnchor, constant: 140).isActive = true
                } else {
                    fieldEmailLabel.topAnchor.constraint(equalTo: self.fieldNameLabel.bottomAnchor, constant: 70).isActive = true
                    fieldEmailTextField.topAnchor.constraint(equalTo: fieldEmailLabel.topAnchor, constant: 0).isActive = true
                }
                
                
                buildSeparatorLine(for: fieldEmailLabel)
                
            case .password:
                self.modalView.addSubview(fieldPasswordLabel)
                fieldPasswordLabel.text = "Senha:"
                fieldPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
                fieldPasswordLabel.font = UIFont.systemFont(ofSize: 20)
                fieldPasswordLabel.leftAnchor.constraint(equalTo: self.modalView.leftAnchor, constant: 21).isActive = true
                fieldPasswordLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
                
                self.modalView.addSubview(fieldPasswordTextField)
                fieldPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
                fieldPasswordTextField.font = UIFont.systemFont(ofSize: 19)
                fieldPasswordTextField.isSecureTextEntry = true
                fieldPasswordTextField.leftAnchor.constraint(equalTo: fieldPasswordLabel.rightAnchor).isActive = true
                fieldPasswordTextField.rightAnchor.constraint(equalTo: self.modalView.rightAnchor, constant: -21).isActive = true
                fieldPasswordTextField.bottomAnchor.constraint(equalTo: fieldPasswordLabel.bottomAnchor, constant: 0).isActive = true
                
                if formType == .login{
                    fieldPasswordLabel.topAnchor.constraint(equalTo: self.fieldEmailLabel.bottomAnchor, constant: 70).isActive = true
                    fieldPasswordTextField.topAnchor.constraint(equalTo: self.fieldEmailTextField.bottomAnchor, constant: 70).isActive = true
                } else {
                    fieldPasswordLabel.topAnchor.constraint(equalTo: self.fieldEmailLabel.bottomAnchor, constant: 70).isActive = true
                    fieldPasswordTextField.topAnchor.constraint(equalTo: fieldPasswordLabel.topAnchor, constant: 0).isActive = true
                }
                
                
                
                buildSeparatorLine(for: fieldPasswordLabel)
                
            }
        }
    }
    
    func buildActionButton() {
        let actionButton = UIButton()
        self.modalView.addSubview(actionButton)
        actionButton.backgroundColor =  #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        let buttonTitle = formType == .register ?  "Cadastrar" : "Entrar"
        actionButton.clipsToBounds = true
        actionButton.layer.cornerRadius = 15
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.setTitleColor(#colorLiteral(red: 0.3098039216, green: 0.4156862745, blue: 0.5411764706, alpha: 1), for: .highlighted)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.centerXAnchor.constraint(equalTo: self.modalView.centerXAnchor).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        actionButton.topAnchor.constraint(equalTo: fieldPasswordLabel.bottomAnchor, constant: 30).isActive = true
        if formType == . login {
            actionButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        } else {
            actionButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        }   
    }
    
    func userInfo(user: User) {
        dump(user)
    }
    
    @objc func registerAction() {
        guard let email = self.fieldEmailTextField.text, let password = self.fieldPasswordTextField.text, let name = self.fieldNameTextField.text else { return }
        
        let userForm = UserForm(name: name, email: email, password: password)
        Authenticate.registerUser(user: userForm) { userData in
            print(userData)
        }
    }

    @objc func loginAction() {
        
        let userApp = User(name: "Pedro Emanuel", email: "ped1256@hotmail.com", avatar: nil, Challenges: nil, score: 1000)
        let dashboardViewController = DashBoardViewController()
        dashboardViewController.user = userApp
        self.present(dashboardViewController, animated: true)
        
//        guard let email = self.fieldEmailTextField.text, let password = self.fieldPasswordTextField.text else { return }
//
//        Authenticate.loginUser(email: email, password: password) { user in
//            let userApp = User(name: user.name, email: user.email, avatar: nil, Challenges: nil, score: 1000)
//            let dashboardViewController = DashBoardViewController()
//            self.present(dashboardViewController, animated: true)
//        }
    }
    
    @objc func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {

            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            
        }) { (success) in
            
        }
    }
    
    func buildSeparatorLine(for element: UIView){
     
        let separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        self.modalView.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.leftAnchor.constraint(equalTo: element.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: modalView.rightAnchor, constant: -21).isActive = true
        separatorView.topAnchor.constraint(equalTo: element.bottomAnchor, constant: 10).isActive = true
    }
    
    @objc func hideKeyboard() {
        self.fieldNameTextField.resignFirstResponder()
        self.fieldEmailTextField.resignFirstResponder()
        self.fieldPasswordTextField.resignFirstResponder()
    }
    
    
}
