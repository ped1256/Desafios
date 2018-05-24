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
    let infoView = UserInfoView()
//    var delegate: ChallengesFlowDelegate
    var user: User?
    
//    public convenience init(user: User) {
//        self.init(user: user)
//        self.delegate = delegate
//        self.user = user
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareHomeLayout()
        addUserInfoView()
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

    func addActionsButton(){
        //capture object challenge button
        
    }
    
    @objc func actionButton(_ sender: UIButton) {
        switch sender.tag {
        case ChallengeType.capture.hashValue:
            showChallengView(type: .capture)
        default:
            return
        }
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
    
    func showChallengView(type: ChallengeType) {
        
    }
}
