
import Foundation
import UIKit

protocol GameState {
    //MARK: - Properties
    var backIcon: String { get }
    var iconsInUse: [String] { get set }
    var backgroundColor: UIColor { get }
    var transitionSentence: String { get }
    
    //MARK: - Methods
    func setNextState(gameCollectionVC: GameCollectionVC)
    func updateState()
    func shuffleCards(collectionView: UICollectionView)
    func keepTrackOfHits(selectedCards: [IndexPath], gameCollectionVC: GameCollectionVC, indexPath: IndexPath)
}
