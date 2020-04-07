//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

// Present the view controller in the Live View window

PlaygroundPage.current.needsIndefiniteExecution = true
let window = UIWindow()
window.frame.size = CGSize(width: 768, height: 576)
let initialViewController = InitialViewController()
initialViewController.preferredContentSize = CGSize(width: 768, height: 576)
window.rootViewController = initialViewController
window.makeKeyAndVisible()

PlaygroundPage.current.liveView = window

