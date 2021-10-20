//
//  ProfileView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/08.
//

import UIKit
import StackERView

class ProfileView: UIView {
    let profileImage: UIImageView = UIImageView()
    
    let nameLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .aspasiaPurple
        
        let stack = VStackERView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        profileImage.frame.size = CGSize(width: 120, height: 120)
        profileImage.backgroundColor = .lightGray
        profileImage.layer.cornerRadius = 60
        profileImage.layer.shadowPath = CGPath(ellipseIn: CGRect(x: 5, y: 5, width: 125, height: 125), transform: nil)
        profileImage.layer.shadowOpacity = 0.2
        profileImage.layer.shadowRadius = 10
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 4
        stack.push(profileImage)
        
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textColor = .label
        nameLabel.text = "이름"
        stack.push(nameLabel, spacing: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
