//
//  GameCollectionViewCell.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 26/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    var icon = String()
    
    override func awakeFromNib() {
        let imgView = UILabel()
        imgView.frame = CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 20, height: 20)
        
    }
}
