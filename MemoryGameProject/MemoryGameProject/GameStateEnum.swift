//
//  GameStateEnum.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 27/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation

enum GameStateEnum {
    case level1
    case level2
    case level3
    
    var backIcon: String {
        switch self {
        case .level1:
            return "young"
        case .level2:
            return "adult"
        case .level3:
            return "old"
        }
    }
}
