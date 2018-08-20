//
//  UserRequestAuthorizations.swift
//  desafios
//
//  Created by Pedro Emanuel on 17/04/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import AVKit

class UserRequestAuthorizations: NSObject {
    
    static func requestCameraAuthorization() {
        AVCaptureDevice.requestAccess(for: .video) { (authorized) in
            
        }
    }
    
    static func userIsAuthenticated() -> Bool {
        if AVCaptureDevice.authorizationStatus(for: .video) == AVAuthorizationStatus.authorized{
            return true
        } else {
            return false
        }
    }
}
