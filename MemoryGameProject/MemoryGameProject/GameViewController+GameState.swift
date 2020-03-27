//
//  GameViewController+GameState.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 27/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: GameState {
    
    internal func shuffleCards() {
        switch self.gameState {
        case .level2:
            //TODO: verify if only two cards are missing
            shuffle()
        case .level3:
            shuffle()
        default:
            return
        }
    }
    
    private func shuffle(){
        //TODO: shuffle cards
    }
    
    internal func createTension() {
        if gameState == .level3 {
            //TODO: Animation to create tension
        }
    }
    
    internal func showMistake() {
        //TODO: verify if only two cards are missing
        if gameState == .level2 {
            //TODO: show message try again if only two cards are missing
        }
    }
    
    internal func prepareCards() {
        switch self.gameState {
        case .level3:
            self.chooseIcons(amount: 6)
        default:
            self.chooseIcons(amount: 3)
        }
    }
    
    private func chooseIcons(amount: Int) {
        self.usedIcons.removeAll()
        var iconsChosen = 0
        
        while iconsChosen < amount{
            let icon = self.icons[Int.random(in: 0..<6)]
            if !self.usedIcons.contains(icon) {
                self.usedIcons.append(icon)
                iconsChosen+=1
            }
        }
        
        if amount == 3 {
            
        }
    }
    
    
}
