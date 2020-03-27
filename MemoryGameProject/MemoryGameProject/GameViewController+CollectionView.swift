//
//  GameViewController+CollectionView.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 26/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCollectionViewCell
        
        cell.icon = gameState.backIcon
        
        return cell
    }
}
