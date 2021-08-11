//
//  ProfileViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit
import StackERView

class ProfileViewController: UIViewController {
    let scrollView = VStackERScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        scrollView.stackAlignment = .left
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        let banner = UIView()
        banner.backgroundColor = .systemRed
        scrollView.setBanner(banner, height: 400)

        for _ in 0..<15 {
            let label = UILabel()
            label.textColor = .black
            label.font = .systemFont(ofSize: 24)
            label.text = "프로필 정보가 나오는 화면입니다."

            scrollView.push(label, spacing: 10)
        }
    }
}
