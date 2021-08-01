//
//  ProfileViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class ProfileViewController: UIViewController {
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
        
        for _ in 0..<10 {
            let label = UILabel()
            label.textColor = .black
            label.font = .systemFont(ofSize: 24)
            label.text = "프로필 정보가 나오는 화면입니다."
            
            scrollView.push(label, spacing: 10)
        }
    }
}
