//
//  GameCollectionViewCell.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 26/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    var icon = String()
    var hiddenIcon = String()
    let imgView = UIImageView()
    
    //MARK: - Methods
    override func draw(_ rect: CGRect) {
        self.contentView.backgroundColor = .gray
        
        self.imgView.contentMode = .scaleAspectFit
        self.imgView.frame = CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 100, height: 100)
        self.imgView.image = UIImage(named: icon)
        
        self.contentView.addSubview(imgView)
    }
    
    func setSelected() {
        self.imgView.image = UIImage(named: hiddenIcon)
    }
    
}
