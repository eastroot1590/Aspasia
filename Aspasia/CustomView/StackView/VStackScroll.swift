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
        
        addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame.origin = .zero
        contentView.frame.size = CGSize(width: frame.width, height: contentView.frame.height)

        contentSize = contentView.frame.size
    }
    
    func push(_ stack: UIView, spacing: CGFloat) {
        contentView.push(stack, spacing: spacing)
        
//        contentView.layoutIfNeeded()
        contentSize = contentView.frame.size
        print("contentSize = \(contentSize)")
    }
}
