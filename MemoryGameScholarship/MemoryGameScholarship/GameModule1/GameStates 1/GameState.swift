//
//  GameState.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 27/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation
import UIKit

protocol GameState {
    var backIcon: String { get }
    var icons: [String] { get }
    var iconsInUse: [String] { get set }
    
    func updateState()
    func shuffleCards()
    func createTension()
    func showMistake()
}
