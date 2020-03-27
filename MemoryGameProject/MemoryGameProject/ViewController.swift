//
//  ViewController.swift
//  MemoryGameProject
//
//  Created by Bernardo Nunes on 26/03/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    let gameCollectionView = UICollectionView()
    let icons = ["family", "nature", "art", "world", "sport", "work"]
    var gameState: GameStateEnum = .level1 {
        didSet {
            gameCollectionView.reloadData()
        }
    }
    var usedIcons = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
    }
}



