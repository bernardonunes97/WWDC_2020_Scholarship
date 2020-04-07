//
//  ViewController.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 26/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import UIKit

class GameCollectionVC: UICollectionViewController {
    
    //MARK: - Properties
//    let icons = ["family", "nature", "art", "world", "sport", "work"]
    var gameState: GameState = Level1State()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 59, left: 59, bottom: 59, right: 59)
        layout.itemSize = CGSize(width: 193, height: 193)
        
//        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
        self.collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        self.collectionView.backgroundColor = .clear
        self.collectionView.isScrollEnabled = false
        self.collectionView.frame = CGRect(x: 0, y: 0, width: 815, height: 504)
        self.collectionView.collectionViewLayout = layout
        
        gameState.updateState()
        self.collectionView.reloadData()
    }
}



