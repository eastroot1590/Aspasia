//
//  VStackScroll.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackScroll: UIScrollView {
    var contentView: VStackView!
    
    var alignment: UIView.ContentMode {
        get {
            self.contentView.alignment
        }
        set {
            self.contentView.alignment = newValue
        }
    }
    
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
    
    /// VStackScroll에 view를 추가한다.
    /// - parameter stack : 추가할 view
    /// - parameter spacing : 앞서 추가한 view와의 공백
    /// - parameter offset : 수직축에 대한 offset
    func push(_ stack: UIView, spacing: CGFloat = 0, offset: CGFloat = 0) {
        contentView.push(stack, spacing: spacing, offset: offset)
        contentView.frame.size = CGSize(width: frame.width, height: contentView.frame.height)
        contentSize = contentView.frame.size
    }
}
