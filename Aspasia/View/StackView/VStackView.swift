//
//  VStackView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackView: UIView {
    var alignment: UIView.ContentMode = .center
    
    var stack: [Stackable] = []
    
    override var intrinsicContentSize: CGSize {
        return frame.size
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: 0)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// VStackView에 view를 추가한다.
    /// - parameter stack : 추가할 view
    /// - parameter spacing : 앞서 추가한 view와의 공백
    /// - parameter offset : 수직축에 대한 offset
    func push(_ child: UIView, spacing: CGFloat = 0, offset: CGFloat = 0) {
        child.sizeToFit()
        
        let node = Stackable(view: child, spacing: spacing, offset: offset)
        
        // layout
        if child.frame.width > 0 {
            alignmentLayout(node, minY: frame.height)
        } else {
            fillLayout(node, minY: frame.height)
        }
        
        // add
        addSubview(child)
        
        // append stack
        stack.append(node)
        
        // extend frame to fit stack
        let height = frame.height + spacing + child.frame.height
        frame.size = CGSize(width: frame.width, height: height)
    }
    
    /// 스택에 추가한 순서대로 등장 애니메이션을 재생한다.
    func playCascade() {
        var playing: Int = 0
        
        for node in stack {
            node.view.transform = CGAffineTransform(translationX: 0, y: -20)
            node.view.alpha = 0
            
            UIView.animate(withDuration: 0.1, delay: 0.05 * Double(playing), animations: {
                node.view.alpha = 1
                node.view.transform = .identity
            })
            
            playing += 1
        }
    }
    
    /// child 본인의 넓이와 높이에 맞게 정렬하는 레이아웃
    private func alignmentLayout(_ node: Stackable, minY: CGFloat) {
        // default center
        var origin = CGPoint(x: frame.width / 2 - node.view.frame.width / 2, y: minY + node.spacing)
        
        switch alignment {
        case .left:
            origin.x = node.offset
            
        case .right:
            origin.x = frame.width - node.view.frame.width + node.offset
            
        default:
            break
        }
        
        node.view.frame.origin = origin
    }
    
    /// child 본인의 높이를 가지며 좌우로 가득 차는 레이아웃
    private func fillLayout(_ node: Stackable, minY: CGFloat) {
        node.view.frame = CGRect(x: node.offset, y: minY + node.spacing, width: frame.width, height: node.view.frame.height)
    }
}
