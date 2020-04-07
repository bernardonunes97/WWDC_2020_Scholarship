
import Foundation
import UIKit

extension GameCollectionVC: UICollectionViewDelegateFlowLayout{
    
    //MARK: - DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameState.iconsInUse.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.gameCollectionViewCellID, for: indexPath) as! GameCollectionViewCell
        
        cell.backIcon = gameState.backIcon
        cell.frontIcon = gameState.iconsInUse[indexPath.row]
        cell.isMatched = false
        
        return cell
    }
    
    //MARK: - Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexPathsForSelectedCards = collectionView.indexPathsForSelectedItems else {
            return
        }
        
        self.gameState.keepTrackOfHits(selectedCards: indexPathsForSelectedCards, gameCollectionVC: self, indexPath: indexPath)
        
        let gameCell = collectionView.cellForItem(at: indexPath) as! GameCollectionViewCell
//        gameCell.flipCard()
        
        if indexPathsForSelectedCards.count%2 == 0 {
            
            let previousSelectedAr = indexPathsForSelectedCards.compactMap { (cellIndexPath) -> GameCollectionViewCell? in
                let cell = collectionView.cellForItem(at: cellIndexPath) as! GameCollectionViewCell
                if !cell.isMatched && cellIndexPath != indexPath{
                    return cell
                }
                return nil
            }
            
            guard let previousSelected = previousSelectedAr.first else { return }
            
            if previousSelected.frontIcon == gameCell.frontIcon {
                
                gameCell.isMatched = true
                previousSelected.isMatched = true
                
                self.showIndication(text: "Hit!")
                
                if indexPathsForSelectedCards.count == 6 {
                    for view in self.progressStackView.arrangedSubviews {
                        view.alpha = 0
                    }
                    self.gameState.setNextState(gameCollectionVC: self)
                    self.gameState.updateState()
                    
                    UIView.animate(withDuration: 3, animations: {
                        collectionView.alpha = 0.0
                        self.transitionView.alpha = 1.0
                    }) { (_) in
                        collectionView.reloadData()
                        UIView.animate(withDuration: 3, animations: {
                            self.transitionView.alpha = 0
                            collectionView.alpha = 1.0
                            for view in self.progressStackView.arrangedSubviews {
                                view.alpha = 1.0
                            }
                            self.view.backgroundColor = self.gameState.backgroundColor
                        }){ (_) in
                            self.transitionLabel.text = self.gameState.transitionSentence
                        }
                    }
                }
            } else {
                
                self.showIndication(text: "Miss!")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    collectionView.deselectItem(at: indexPath, animated: false)
                    //                gameCell.flipCard()
                    print("+++++")
                    guard let previousCellIndexPath = collectionView.indexPath(for: previousSelected) else { return }
                    
                    collectionView.deselectItem(at: previousCellIndexPath, animated: false)
                    let previousCell = collectionView.cellForItem(at: previousCellIndexPath) as! GameCollectionViewCell
                    //                previousCell.flipCard()
                    
                    self.gameState.shuffleCards(collectionView: collectionView)
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let indexPathsForSelectedCards = collectionView.indexPathsForSelectedItems else {
            return
        }
        
        let gameCell = collectionView.cellForItem(at: indexPath) as! GameCollectionViewCell
        
        if gameCell.isMatched || indexPathsForSelectedCards.count%2 == 0{
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        } else {
//            gameCell.flipCard()
        }
    }
    
    //MARK: - FlowLayout Delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 145)
    }
}
