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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var height: CGFloat = 0
        
        for node in stack {
            let nodeHeight = node.view.frame.height
            
            node.view.frame.origin = CGPoint(x: 0, y: height + node.spacing)
            node.view.frame.size = CGSize(width: frame.width, height: nodeHeight)
            
            height += nodeHeight + node.spacing
        }
    }
    
    func push(_ child: UIView, spacing: CGFloat) {
        let oldHeight = frame.height
        
        let stackNode = StackNode(view: child, spacing: spacing)
        stack.append(stackNode)
        
        addSubview(child)
        
        let newHeight = oldHeight + spacing + stackNode.view.frame.height
        frame.size = CGSize(width: frame.width, height: newHeight)
    }
}
