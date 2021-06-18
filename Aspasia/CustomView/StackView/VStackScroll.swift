//
//  VStackScroll.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackScroll: UIScrollView {
    let contentView: VStackView = VStackView()
    
    init() {
        super.init(frame: .zero)
        
        contentView.backgroundColor = .blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        let height = contentView.heightAnchor.constraint(equalTo: heightAnchor)
        height.priority = .defaultHigh
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            height
        ])
    }
    
    func push(_ stack: UIView, spacing: CGFloat) {
        contentView.push(stack, spacing: spacing)
        
        contentView.layoutIfNeeded()
        contentSize = contentView.frame.size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
