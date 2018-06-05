//
//  Difficulty.swift
//  desafios
//
//  Created by Pedro Emanuel on 07/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
enum Difficulty {
    case easy, normal, hard, extreme
    
    var description: String {
            switch self {
            case .easy:
                return "Desafio Iniciante"
            case .normal:
                return "Desafio Normal"
            case .hard:
                return "Desafio Dificíl"
            case . extreme:
                return "Desafio muito Dificíl"
        }
    }
}
