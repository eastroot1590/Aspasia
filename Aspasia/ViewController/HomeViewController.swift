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
        scrollView.alignment = .left
        view.addSubview(scrollView)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let banner = UIView()
        banner.backgroundColor = .systemRed
        scrollView.setBanner(banner, height: 400)
        
        for i in 0..<20 {
//            let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 50)))
//            view.backgroundColor = UIColor(white: CGFloat(i) / 20, alpha: 1)
            let label = UILabel()
            label.textColor = .black
            label.font = .systemFont(ofSize: 16)
            label.text = "맛좀 봐라 이뇨속아"
            
            scrollView.push(label, spacing: 10, offset: CGFloat(i * 10))
        }
    }
}
