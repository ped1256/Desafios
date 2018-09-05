//
//  UserInfoView.swift
//  desafios
//
//  Created by Pedro Emanuel on 24/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class UserInfoView: UIView {
    
    var imageView = UIImageView()
    var nameLabel = UILabel()
    var scoreTitleLabel = UILabel()
    var challengedTitleLabel = UILabel()
    var scoreValueLabel = UILabel()
    var challengedValueLabel = UILabel()
    var separatorView = UIView()
    
    var user: User? {
        didSet{
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUserImageView()
        addUserNameView()
        addUserStatusInfoView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addUserImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -30),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -30)
            ])
        imageView.layer.cornerRadius = 300 / 4
        imageView.clipsToBounds = true
        
        if let user = self.user {
            imageView.image = user.avatar
        }else {
            imageView.image = #imageLiteral(resourceName: "persondefault")
        }
    }
    
    func addUserNameView() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .center
        nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 18),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18)
            ])
        
        if let user = self.user {
            nameLabel.text = user.name
        } else {
            nameLabel.text = "Remela Severson"
        }
    }
    
    func addUserStatusInfoView() {
        self.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9176470588, blue: 0.9411764706, alpha: 1)
        
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 62),
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            separatorView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 18),
            separatorView.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor)
            ])
        
        self.addSubview(scoreTitleLabel)
        scoreTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        scoreTitleLabel.textColor = #colorLiteral(red: 0.9019607843, green: 0.9176470588, blue: 0.9411764706, alpha: 1)
        scoreTitleLabel.text = "Pontos"
        
        NSLayoutConstraint.activate([
            scoreTitleLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            scoreTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 18),
            ])
        
        self.addSubview(challengedTitleLabel)
        challengedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        challengedTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        challengedTitleLabel.textColor = #colorLiteral(red: 0.9019607843, green: 0.9176470588, blue: 0.9411764706, alpha: 1)
        challengedTitleLabel.text = "Desafios"

        NSLayoutConstraint.activate([
            challengedTitleLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            challengedTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 18),
            ])

    }
    
    func updateUI() {
        guard let user = self.user else { return }
        scoreTitleLabel.text = "Pontos \(user.score ?? 0)"
        nameLabel.text = user.name
        imageView.image = user.avatar ?? #imageLiteral(resourceName: "userWithoutImage")
    }
    
}
