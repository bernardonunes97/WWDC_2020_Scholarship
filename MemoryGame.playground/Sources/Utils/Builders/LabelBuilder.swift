
import Foundation
import UIKit

class LabelBuilder {
    private let textColor: UIColor
    private let fontName: String
    
    public private(set) var frame = CGRect()
    public private(set) var fontSize = CGFloat()
    public private(set) var text = ""
    
    init(textColor: UIColor, fontName: String) {
        self.textColor = textColor
        self.fontName = fontName
    }
    
    func setFrame(frame: CGRect) {
        self.frame = frame
    }
    
    func setFontSize(fontSize: CGFloat) {
        self.fontSize = fontSize
    }
    
    func setText(text: String) {
        self.text = text
    }
    
    func returnLabel() -> UILabel {

        let label = UILabel(frame: self.frame)
        label.font = UIFont(name: self.fontName, size: self.fontSize)
        label.text = self.text
        label.textColor = self.textColor
        label.textAlignment = .center
        
        self.frame = CGRect()
        self.fontSize = CGFloat()
        self.text = ""
        
        return label
    }
}

