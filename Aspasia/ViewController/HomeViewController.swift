//
//  HomeViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let scroll = VStackScroll()
        scroll.backgroundColor = .yellow
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        for _ in 0..<20 {
            let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 50)))
            view.backgroundColor = .green
            
            scroll.push(view, spacing: 10)
        }
    }
}
