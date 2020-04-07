//
//  GameViewController+GameState.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 27/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation
import UIKit

class Level1State: GameState {
   
    let backIcon = "young"
    internal let icons = ["nature", "art", "world", "sport", "work"]
    var iconsInUse = [String]()
    
    func updateState(){
        while self.icons.count < 6 {
            let icon = icons[Int.random(in: 0..<icons.count)]
            if !self.iconsInUse.contains(icon) {
                self.iconsInUse.append(icon)
                self.iconsInUse.append(icon)
            }
        }
        self.iconsInUse.shuffle()
    }
    
    func shuffleCards() {
        //        switch self.gameState {
        //        case .level2:
        //            //TODO: verify if only two cards are missing
        //            self.usedIcons.shuffle()
        //        case .level3:
        //            self.usedIcons.shuffle()
        //        default:
        //            return
        //        }
    }
    
    func createTension() {
        
    }
    
    func showMistake() {
        
    }
    

    
}

