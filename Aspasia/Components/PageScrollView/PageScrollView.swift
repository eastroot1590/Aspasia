//
//  PageScrollView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/27.
//

import UIKit

/// 페이지 단위로 스크롤할 수 있는 view
class PageScrollView: UIView {
    var pageCount: Int = 0
    
    var pages: [UIView] {
        pageStack.arrangedSubviews
    }
    
    private let pageScroll = UIScrollView()
    private let pageStack = UIStackView()
    private let pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pageScroll.delegate = self
        pageScroll.decelerationRate = .fast
        pageScroll.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pageScroll)
        NSLayoutConstraint.activate([
            pageScroll.topAnchor.constraint(equalTo: topAnchor),
            pageScroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageScroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageScroll.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        pageStack.axis = .horizontal
        pageStack.translatesAutoresizingMaskIntoConstraints = false
        pageScroll.addSubview(pageStack)
        NSLayoutConstraint.activate([
            pageStack.centerYAnchor.constraint(equalTo: pageScroll.centerYAnchor),
            pageStack.heightAnchor.constraint(equalTo: pageScroll.heightAnchor),
            pageStack.leadingAnchor.constraint(equalTo: pageScroll.leadingAnchor)
        ])
        
        pageControl.currentPage = 0
        pageControl.backgroundStyle = .prominent
        pageControl.addTarget(self, action: #selector(didSelectPage(_:)), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pageScroll.contentSize = CGSize(width: CGFloat(pageCount) * frame.width, height: frame.height)
    }
    
    @objc func didSelectPage(_ sender: UIPageControl) {
        let offset = pageScroll.frame.width * CGFloat(sender.currentPage)
        pageScroll.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
    func addPage(_ page: UIView) {
        page.translatesAutoresizingMaskIntoConstraints = false
        pageStack.addArrangedSubview(page)
        NSLayoutConstraint.activate([
            page.widthAnchor.constraint(equalTo: pageScroll.widthAnchor)
        ])
        
        pageCount += 1
        pageControl.numberOfPages = pageCount
    }
}

extension PageScrollView: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentPage = targetContentOffset.pointee.x / (pageScroll.frame.width)
        
        targetContentOffset.initialize(to: CGPoint(x: currentPage.rounded() * (pageScroll.frame.width), y: 0))
        
        pageControl.currentPage = Int(currentPage.rounded())
    }
}
