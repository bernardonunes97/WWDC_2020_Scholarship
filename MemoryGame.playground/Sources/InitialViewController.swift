//
//  InitialViewController.swift
//  MemoryGameScholarship
//
//  Created by Bernardo Nunes on 03/04/20.
//  Copyright © 2020 Bernardo Nunes. All rights reserved.
//

import UIKit

public class InitialViewController: UIViewController {

    //MARK: - Properties
    private let labelBuilder = LabelBuilder(textColor: UIColor(displayP3Red: 150/255, green: 10/255, blue: 10/255, alpha: 1),
                                            fontName: "SFCompactDisplay-Regular")
    
    //MARK: - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.registerFonts(fontFileName: "SF-Compact-Display-Regular", fileExtension: ".otf")
        self.registerFonts(fontFileName: "LilitaOne-Regular", fileExtension: "ttf")
        self.view.backgroundColor = UIColor(displayP3Red: 29/255, green: 188/255, blue: 41/255, alpha: 1)
        
        //Labels Settings
        self.setUpLabel(text: "Memory Game",
                        frame: CGRect(x: 148, y: 46, width: 500, height: 99),
                        fontSize: 70)
        self.setUpLabel(text: "Touch to Start",
                        frame: CGRect(x: 282, y: 468, width: 500, height: 44),
                        fontSize: 35)
        
        //Cards Settings
        self.setUpImgView(imageName: "young", viewPosition: CGPoint(x: 213, y: 216), zPosition: 0, roationAngle: -CGFloat.pi/6)
        self.setUpImgView(imageName: "adult", viewPosition: CGPoint(x: 411, y: 216), zPosition: 0, roationAngle: CGFloat.pi/6)
        self.setUpImgView(imageName: "old", viewPosition: CGPoint(x: 312, y: 189), zPosition: 10, roationAngle: 0)
    }
    
    //Moving to next screen
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 44, left: 44, bottom: 44, right: 44)
        layout.itemSize = CGSize(width: 145, height: 145)
        layout.minimumInteritemSpacing = 88
        layout.minimumLineSpacing = 88
        
        let collectionViewController = GameCollectionVC(collectionViewLayout: layout)
        collectionViewController.modalPresentationStyle = .fullScreen
        self.present(collectionViewController, animated: true, completion: nil)
    }
    
    /// Method that sets up an image view
    /// - Parameters:
    ///   - imageName: name of image to be shown
    ///   - viewPosition: position os the view in the screen
    ///   - zPosition: Views 3d position
    ///   - roationAngle: angle to be animated
    private func setUpImgView(imageName: String, viewPosition: CGPoint, zPosition: CGFloat, roationAngle: CGFloat){
        let viewRect = CGRect(origin: viewPosition, size: CGSize(width: 145, height: 145))
        let imgView = UIImageView(frame: viewRect)
        imgView.image = UIImage(named: imageName)
        imgView.frame.origin = viewPosition
        imgView.contentMode = .center
        imgView.backgroundColor = .white
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        imgView.layer.zPosition = zPosition
        imgView.layer.borderColor = CGColor(srgbRed: 70/255, green: 70/255, blue: 70/255, alpha: 1)
        imgView.layer.borderWidth = 1.0
        
        self.view.addSubview(imgView)
        
        if roationAngle != 0 {
            UIView.animate(withDuration: 3) {
                imgView.transform = CGAffineTransform(rotationAngle: roationAngle)
            }
        }
    }
    
    /// Method that sets up labels
    /// - Parameters:
    ///   - text: Label's text
    ///   - frame: Label's frame on the screen
    ///   - fontSize: Font size of text in label
    private func setUpLabel(text: String, frame: CGRect, fontSize: CGFloat) {
        self.labelBuilder.setText(text: text)
        self.labelBuilder.setFrame(frame: frame)
        self.labelBuilder.setFontSize(fontSize: fontSize)
        let label = self.labelBuilder.returnLabel()
        label.center.x = self.view.center.x
        
        self.view.addSubview(label)
    }
    
    private func registerFonts(fontFileName: String, fileExtension: String) {
        let cfURL = Bundle.main.url(forResource: fontFileName, withExtension: fileExtension)! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
    }
}
