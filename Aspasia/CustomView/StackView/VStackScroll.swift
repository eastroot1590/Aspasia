//
//  VStackScroll.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackScroll: UIScrollView {
    var alignment: UIView.ContentMode {
        get {
            self.contentView.alignment
        }
        set {
            self.contentView.alignment = newValue
        }
    }
    
    var contentView: VStackView!
    
    var bannerView: UIView?
    var bannerHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        showsHorizontalScrollIndicator = false
        
        contentView = VStackView(frame: frame)
        addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutBanner()
    }
    
    /// VStackScroll에 view를 추가한다.
    /// - parameter stack : 추가할 view
    /// - parameter spacing : 앞서 추가한 view와의 공백
    /// - parameter offset : 수직축에 대한 offset
    func push(_ stack: UIView, spacing: CGFloat = 0, offset: CGFloat = 0) {
        // simply delegate push
        contentView.push(stack, spacing: spacing, offset: offset)
        
        // extent contentSize to fit banner + contentView
        contentSize = CGSize(width: frame.width, height: bannerHeight + contentView.frame.height)
    }
    
    /// StickyHeader 레이아웃을 가지는 배너를 추가한다.
    func setBanner(_ banner: UIView, height: CGFloat) {
        bannerView = banner
        bannerHeight = height
        
        addSubview(banner)
        
        // layout
        layoutBanner()
        
        // update contentView's position
        contentView.frame.origin = CGPoint(x: 0, y: height)
    }
    
    /// 배너 레이아웃
    /// StickyHeader layout.
    private func layoutBanner() {
        guard let banner = bannerView else {
            return
        }
        
        let offset = min(contentOffset.y, 0)
        let bannerHeightMax = bannerHeight - offset
        
        banner.frame.origin = CGPoint(x: 0, y: offset)
        
        if frame.height > bannerHeightMax {
            banner.frame.size = CGSize(width: frame.width, height: bannerHeightMax)
        } else {
            banner.frame.size = frame.size
        }
    }
}
