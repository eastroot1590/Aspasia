//
//  HomeViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class HomeViewController: UIViewController {
    var scrollView: VStackScroll!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        scrollView = VStackScroll(frame: view.frame)
        view.addSubview(scrollView)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        for i in 0..<20 {
            let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 50)))
            view.backgroundColor = UIColor(white: CGFloat(i) / 20, alpha: 1)
            
            scrollView.push(view, spacing: 10)
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeFrame)))
    }
}
