//
//  Level2State.swift
//  MemoryGameScholarship
//
//  Created by Bernardo Nunes on 02/04/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation
import UIKit

class Level2State: GameState {
    
    //MARK: - Protocol Properties
    private var icons = ["nature", "art", "world", "sport", "work"]
    let backIcon = "adult"
    var iconsInUse = [String]()
    let backgroundColor = UIColor(displayP3Red: 93/255, green: 188/255, blue: 100/255, alpha: 1)
    let transitionSentence = "This keeps getting harder..."
    
    //MARK: - Properties
    var finalMisses = 0
    var missingIcon = String()
    var cellsToReload = [IndexPath]()
    
    //MARK: - Protocol Methods
    func setNextState(gameCollectionVC: GameCollectionVC) {
        gameCollectionVC.gameState = Level3State()
        gameCollectionVC.progressStackView.arrangedSubviews[1].backgroundColor = .clear
        gameCollectionVC.progressStackView.arrangedSubviews[2].backgroundColor = .white
        print("indo level 3")
    }
    
    func updateState() {
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
        if finalMisses == 2 {
            collectionView.reloadItems(at: self.cellsToReload)
        }
    }
    
    func keepTrackOfHits(selectedCards: [IndexPath], gameCollectionVC: GameCollectionVC, indexPath: IndexPath){
        if selectedCards.count == 5 {
            
            var range = Set(0...5)
            let selected = Set(selectedCards.map { $0.row })
            range.subtract(selected)
            guard let notSelected = Array(range).first else { return }
            
            if self.finalMisses == 0 {
                self.missingIcon = self.iconsInUse[notSelected]
            }
            
            let missingIndexPath = IndexPath(row: notSelected, section: 0)
            if finalMisses == 2 {
                self.iconsInUse[indexPath.row] = self.missingIcon
                self.iconsInUse[notSelected] = self.missingIcon
                
                self.cellsToReload.append(contentsOf: [missingIndexPath, indexPath])
                return
            }
            
            let selectedIcons = selectedCards.map { self.iconsInUse[$0.row] }
            
            self.icons.removeAll(where: {selectedIcons.contains($0)})
            self.icons.removeAll(where: {iconsInUse[notSelected] == $0})
            
            guard let randomIcon = self.icons.randomElement() else { return }
            
            self.iconsInUse[missingIndexPath.row] = randomIcon
            gameCollectionVC.collectionView.reloadItems(at: [missingIndexPath])

            self.finalMisses+=1
            
//            gameCollectionVC.showIndication(text: "Try Again!")
        }
    }
}
