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
    var frontIcon = String()
    var backIcon = String()
    var isMatched = false
    var cardViews : (frontView: UIImageView, backView: UIImageView)?
    var frontImgView: UIImageView!
    var backImgView: UIImageView!
    let backImgViewTag = 1
    let frontImgViewTag = 1
    
    //MARK: - Methods
    override func draw(_ rect: CGRect) {
        self.contentView.backgroundColor = .clear
        
        self.frontImgView = self.setUpImgView(iconToUse: frontIcon, tag: frontImgViewTag)
        self.backImgView = self.setUpImgView(iconToUse: backIcon, tag: backImgViewTag)
        
        let view = UIView(frame: self.contentView.frame)
        view.backgroundColor = .clear
        view.addSubview(self.backImgView)
        
        let view2 = UIView(frame: self.contentView.frame)
        view2.backgroundColor = .clear
        view2.addSubview(self.frontImgView)
        
        self.backgroundView = view
        self.selectedBackgroundView = view2
        
//        self.contentView.addSubview(self.backImgView)
    }
    
    func flipCard() {
        
        var timeInterval = TimeInterval(exactly: 0)
        
        if backImgView.superview != nil {
            self.cardViews = (frontView: frontImgView, backView: backImgView)
        } else {
            self.cardViews = (frontView: backImgView, backView: frontImgView)
             timeInterval = 1
        }
        
        UIView.animate(withDuration: timeInterval ?? 0, animations: {}) { (finished) in
            if finished {
                UIView.transition(with: self.contentView, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
                    self.cardViews?.backView.removeFromSuperview()
                    self.contentView.addSubview(self.cardViews!.frontView)
                }, completion: nil)
            }
        }
     
//        UIView.transition(from: from, to: to, duration: 0.5, options: .transitionFlipFromLeft, completion: nil)
    }
    
    /// Method that sets background view of cell
    /// - Parameter iconToUse: Name of image to be shown
    /// - Parameter imgView: Img View to be set up
    private func setUpImgView(iconToUse: String, tag: Int) -> UIImageView{
        
        let imgView = UIImageView(frame: self.contentView.frame)
        imgView.contentMode = .center
        imgView.backgroundColor = .clear
        imgView.image = UIImage(named: iconToUse)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        imgView.backgroundColor = .gray
        imgView.tag = tag
        
        return imgView
    }
}
