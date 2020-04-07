//
//  Level3State.swift
//  MemoryGameScholarship
//
//  Created by Bernardo Nunes on 03/04/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation
import UIKit

class Level3State: GameState {
    
    //MARK: - Protocol Properties
    let backIcon = "old"
    var iconsInUse = ["nature", "art", "world", "sport", "work", "family"]
    let backgroundColor = UIColor(displayP3Red: 114/255, green: 172/255, blue: 119/255, alpha: 1)
    let transitionSentence = "Decide!"
    let tensionView = RadialGradientView()
    
     //MARK: -Properties
    var misses = 0
    
    //MARK: - Protocol Methods
    func setNextState(gameCollectionVC: GameCollectionVC) {
          
    }
    
    func updateState() {
        self.iconsInUse.shuffle()
    }
    
    func shuffleCards(collectionView: UICollectionView) {
        iconsInUse.shuffle()
        collectionView.reloadData()
    }
    
    private func createTension(gameCollectionVC: GameCollectionVC) {
        self.tensionView.frame = gameCollectionVC.view.frame
        self.tensionView.alpha = 0
        self.tensionView.isUserInteractionEnabled = false
        gameCollectionVC.view.addSubview(self.tensionView)
        
        UIView.animate(withDuration: 1, animations: {
            self.tensionView.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 1, animations: {
                self.tensionView.alpha = 0
            }, completion: nil)
        }
    }
    
    func changeLabelFading(label: UILabel, text: String) {
        label.text = text
        UIView.animate(withDuration: 1, animations: {
            label.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 1, animations: {
                label.alpha = 0
            }, completion: nil)
        }
    }
    
    func keepTrackOfHits(selectedCards: [IndexPath], gameCollectionVC: GameCollectionVC, indexPath: IndexPath) {
        misses+=1
        
        
        if misses > 3 {
            self.createTension(gameCollectionVC: gameCollectionVC)
        }
        
        if misses >= 10 {
            self.tensionView.removeFromSuperview()
            
            guard let collectionView = gameCollectionVC.collectionView else { return }
            for card in collectionView.visibleCells {
                let indexPath = collectionView.indexPath(for: card)
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
            }
   
            gameCollectionVC.transitionLabel.text = "Sooner or later none of this matters..."
            UIView.animate(withDuration: 3, animations: {
                collectionView.alpha = 0
                for view in gameCollectionVC.progressStackView.arrangedSubviews {
                    view.alpha = 0
                }
                gameCollectionVC.transitionView.alpha = 1.0
            }) { (_) in
                UIView.animate(withDuration: 3, animations: {
                    gameCollectionVC.transitionLabel.alpha = 0
                }){ (_) in
                    gameCollectionVC.transitionLabel.text = "This is how old people with dementia feel..."
                    UIView.animate(withDuration: 3, animations: {
                        gameCollectionVC.transitionLabel.alpha = 1.0
                    }) { (_) in
                        UIView.animate(withDuration: 3, animations: {
                            gameCollectionVC.transitionLabel.alpha = 0
                        }) { (_) in
                            gameCollectionVC.transitionLabel.text = "Be patient..."
                            UIView.animate(withDuration: 3, animations: {
                                gameCollectionVC.transitionLabel.alpha = 1.0
                            }) { (_) in
                                UIView.animate(withDuration: 3, animations: {
                                    gameCollectionVC.transitionLabel.alpha = 0
                                }) { (_) in
                                    gameCollectionVC.transitionLabel.text = "RESPECT YOUR ELDERS!"
                                    UIView.animate(withDuration: 3) {
                                        gameCollectionVC.transitionLabel.alpha = 1.0
                                    }
                                }
                            }
                        }
                    
                    }
                }
            }
        }
    }
}
