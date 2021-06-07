//
//  SplashViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/05/12.
//

import UIKit

class SplashViewController: UIViewController {
    // View
    let gradient = CAGradientLayer()
    let titleText = CATextLayer()
    let textGradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경 gradient
        gradient.frame = view.frame
        gradient.startPoint = CGPoint(x: 0.2, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.8, y: 1.0)
        gradient.locations = [0.35, 0.8]
        gradient.colors = [
            CGColor(red: 189/255, green: 176/255, blue: 224/255, alpha: 1.0),
            CGColor(red: 224/255, green: 186/255, blue: 214/255, alpha: 1.0)
        ]
        view.layer.addSublayer(gradient)
        
        // 타이틀 text
        let font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        titleText.contentsScale = UIScreen.main.scale
        titleText.alignmentMode = .center
        titleText.string = "Aspasia"
        titleText.font = font
        textGradient.frame = view.frame
        textGradient.startPoint = CGPoint(x: 0.2, y: 0.0)
        textGradient.endPoint = CGPoint(x: 0.8, y: 1.0)
        textGradient.colors = [
            CGColor(red: 224/255, green: 255/255, blue: 249/255, alpha: 1.0),
            CGColor(red: 255/255, green: 224/255, blue: 237/255, alpha: 1.0)
        ]
        view.layer.addSublayer(textGradient)
        view.layer.addSublayer(titleText)
        textGradient.mask = titleText
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradient.frame = view.frame
        textGradient.frame = view.frame
        
        let size = titleText.preferredFrameSize()
        titleText.frame.origin = CGPoint(x: view.center.x - size.width / 2, y: view.center.y - size.height / 2)
        titleText.frame.size = size
    }
}
