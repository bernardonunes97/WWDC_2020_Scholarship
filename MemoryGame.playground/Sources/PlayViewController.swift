import Foundation
import UIKit
import PlaygroundSupport

public class PlayViewController: UIViewController {
 
    override public func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        view.frame = CGRect(x: 0, y: 0, width: 380, height: 240)
        
        let view2 = UIView()
        view2.backgroundColor = .white
        view2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        self.supportedInterfaceOrientations =
        
        view.addSubview(view2)
        self.view = view
    }
}
