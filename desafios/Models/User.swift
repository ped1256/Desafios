//
//  User.swift
//  desafios
//
//  Created by Pedro Emanuel on 20/04/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import UIKit

var UID: String = ""

struct User {
    let name: String
    let email:String
    let avatar: UIImage?
    let Challenges: [Challenge]?
    let score: Float?
    let level: Level
}

struct UserForm {
    let name: String
    let email:String
    let password: String
}
