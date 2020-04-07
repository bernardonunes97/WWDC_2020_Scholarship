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
    
    //MARK: - Properties
    private let icons = ["nature", "art", "world", "sport", "work"]
    let backIcon = "young"
    var iconsInUse = [String]()
    let backgroundColor =  UIColor(displayP3Red: 29/255, green: 188/255, blue: 41/255, alpha: 1)
    let transitionSentence = "When I was young this used to be so easy..."
    
    //MARK: - Protocol Methods
    func setNextState(gameCollectionVC: GameCollectionVC) {
        gameCollectionVC.gameState = Level2State()
        gameCollectionVC.progressStackView.arrangedSubviews[0].backgroundColor = .clear
        gameCollectionVC.progressStackView.arrangedSubviews[1].backgroundColor = .white
        print("indo level 2")
    }
    
    func updateState(){
        while self.iconsInUse.count < 6 {
            guard let icon = icons.randomElement() else { return }
            if !self.iconsInUse.contains(icon) {
                self.iconsInUse.append(icon)
                self.iconsInUse.append(icon)
            }
        }
        
        self.iconsInUse.shuffle()
    }
    
    func shuffleCards(collectionView: UICollectionView) {
   
    }
    
    func keepTrackOfHits(selectedCards: [IndexPath], gameCollectionVC: GameCollectionVC, indexPath: IndexPath) {
        if selectedCards.count == 6 {
            //TODO:- update state
        }
    }
}

