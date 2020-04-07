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
    var gameState: GameState = Level1State()
    let gameCollectionViewCellID = "gameCellID"
    var transitionLabel = UILabel()
    let transitionView = RadialGradientView()
    let progressStackView = UIStackView(frame: CGRect(x: 299, y: 500, width: 170, height: 30))
    var indicationLabel = UILabel()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CollectionView Settings
        self.collectionView.register(GameCollectionViewCell.self,
                                     forCellWithReuseIdentifier: self.gameCollectionViewCellID)
        self.collectionView.backgroundColor = .clear
        self.collectionView.isScrollEnabled = false
        self.collectionView.allowsMultipleSelection = true

        //GameState Settings
        self.gameState.updateState()
        self.view.backgroundColor = self.gameState.backgroundColor
        
        self.collectionView.reloadData()
        
        //Transition View Settings
        self.transitionView.frame = self.view.frame
        self.transitionView.layer.zPosition = 15
        self.transitionView.colors = [UIColor(displayP3Red: 2/255, green: 2/255, blue: 2/255, alpha: 0.2), UIColor(displayP3Red: 2/255, green: 2/255, blue: 2/255, alpha: 1)]
        self.transitionView.alpha = 0
        
        //Transition Label Settings
        let labelBuilder = LabelBuilder(textColor: UIColor(displayP3Red: 248/255, green: 240/255, blue: 240/255, alpha: 1), fontName: "")
        labelBuilder.setText(text: gameState.transitionSentence)
        labelBuilder.setFontSize(fontSize: 35)
        labelBuilder.setFrame(frame: CGRect(x: 195, y: 260, width: 500, height: 57))
        self.transitionLabel = labelBuilder.returnLabel()
        self.transitionLabel.textAlignment = .center
        
        self.transitionView.addSubview(self.transitionLabel)
        self.view.addSubview(self.transitionView)
    
        //Progress Stack View Settings
        for _ in 0...2 {
            self.progressStackView.addArrangedSubview(self.setProgressView())
        }
        
        self.progressStackView.arrangedSubviews[0].backgroundColor = .white
        self.progressStackView.spacing = 40
        self.progressStackView.axis = .horizontal
        self.progressStackView.alignment = .center
        self.progressStackView.distribution = .equalSpacing
        
        self.view.addSubview(self.progressStackView)
        
        //Indication Label Settings
        labelBuilder.setText(text: "Hit!")
        labelBuilder.setFontSize(fontSize: 35)
        labelBuilder.setFrame(frame: CGRect(x: 282, y: 492, width: 204, height: 44))
        self.indicationLabel = labelBuilder.returnLabel()
        self.indicationLabel.textAlignment = .center
        self.indicationLabel.alpha = 0
        
        self.view.addSubview(self.indicationLabel)
    }
    
    /// Method that creates a view
    private func setProgressView() -> UIView {
        let progressView = UIView()
        progressView.backgroundColor = .clear
        progressView.frame.size = CGSize(width: 30, height: 30)
        progressView.layer.cornerRadius = progressView.frame.height/2
        progressView.clipsToBounds = true
        progressView.layer.borderColor = CGColor(srgbRed: 70/255, green: 70/255, blue: 70/255, alpha: 1)
        progressView.layer.borderWidth = 4
        progressView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return progressView
    }
    
    //MARK: - Game Methods
    func showIndication(text: String) {
        self.indicationLabel.text = text
        
        UIView.animate(withDuration: 0.5, animations: {
            self.progressStackView.alpha = 0
            self.indicationLabel.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 1) {
                self.progressStackView.alpha = 1.0
                self.indicationLabel.alpha = 0
            }
        }
    }
}



