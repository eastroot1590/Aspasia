//
//  VStackScroll.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackScroll: UIScrollView {
    var contentView: VStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        showsHorizontalScrollIndicator = false
        
        contentView = VStackView(frame: frame)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func push(_ stack: UIView, spacing: CGFloat) {
        contentView.push(stack, spacing: spacing)
        contentView.frame.size = CGSize(width: frame.width, height: contentView.frame.height)
        contentSize = contentView.frame.size
    }
}
