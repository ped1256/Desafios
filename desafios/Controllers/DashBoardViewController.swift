//
//  DashBoardViewController
//  desafios
//
//  Created by Pedro Emanuel on 11/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    var captureButton = UIButton()
    let captureChallengeView = DashboardChallengeView()
    let infoView = UserInfoView()
    var challengeSelected: ChallengeType = .capture
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareHomeLayout()
        addUserInfoView()
        addTitleView()
        addChallengeViews(type: .capture)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func prepareHomeLayout() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = true
        let backgroundView = BackgroundView(frame: self.view.frame)
        self.view.addSubview(backgroundView)
    }

    func addUserInfoView() {
        self.view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            infoView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            infoView.topAnchor.constraint(equalTo: self.view.topAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    func addTitleView() {
        let title = UILabel()
        self.view.addSubview(title)
        title.text = "Desafios"
        title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18),
            title.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 50),
            title.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18)
            ])
        
        
        let subtitle = UILabel()
        self.view.addSubview(subtitle)
        subtitle.numberOfLines = 2
        subtitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subtitle.text = "Complete desafios para aumentar o seu nivel e se destacar entre os jogadores"
        subtitle.font = UIFont.systemFont(ofSize: 14, weight: .light)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            subtitle.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18)
            ])
        self.view.addSubview(subtitle)
        
    }
    
    func addChallengeViews(type: ChallengeType) {
        switch type {
        case .capture:
            self.addCaptureChallengeView()
        case .questions:
            return
        case .faceDetection:
            return
        case .pVp:
            return
        }
    }
    
    func addCaptureChallengeView() {
        self.view.addSubview(captureChallengeView)
        
        captureChallengeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            captureChallengeView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18),
            captureChallengeView.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -9),
            captureChallengeView.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 173),
            captureChallengeView.heightAnchor.constraint(equalToConstant: 159)
            ])
        captureChallengeView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8823529412, blue: 0.3529411765, alpha: 1)
        captureChallengeView.image = #imageLiteral(resourceName: "smartPhoneCaptureIcon")
        captureChallengeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(initChallengeFlow)))
    }
    
    @objc func initChallengeFlow() {
        let challengeFlowController = ChallengeFlowController(presenter: self)
        challengeFlowController.presenter = self
        challengeFlowController.selectChallenge(challengeType: challengeSelected)
    }
}
