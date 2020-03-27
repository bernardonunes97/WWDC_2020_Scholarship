//
//  GameState.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 27/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation

protocol GameState {    
    func shuffleCards()
    func createTension()
    func showMistake()
    func prepareCards()
}
