//
//  VStackView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackView: UIView {
    /// StackView에 추가할 수 있는 Node
    struct StackNode {
        /// 앞 화면과 공백
        var view: UIView
        var spacing: CGFloat
    }
    
    var alignment: UIView.ContentMode = .center
    
    var stack: [StackNode] = []
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: 0)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        var height: CGFloat = 0
//
//        for node in stack {
//            let nodeHeight = node.view.frame.height
//
//            node.view.frame.origin = CGPoint(x: 0, y: height + node.spacing)
//            node.view.frame.size = CGSize(width: frame.width, height: nodeHeight)
//
//            height += nodeHeight + node.spacing
//        }
//    }
    
    func push(_ child: UIView, spacing: CGFloat) {
        // child frame
        child.frame.origin = CGPoint(x: child.frame.width > 0 ? frame.width / 2 - child.frame.width / 2 : 0, y: frame.height)
        child.frame.size = CGSize(width: child.frame.width > 0 ? child.frame.width : frame.width, height: child.frame.height)
        
        // stack frame
        frame.size = CGSize(width: frame.width, height: frame.height + spacing + child.frame.height)
        
        // add
        addSubview(child)
        
        // append stack
        let stackNode = StackNode(view: child, spacing: spacing)
        stack.append(stackNode)
    }
}
