//
//  VStackView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackView: UIView, Stackable {
    var lastStack: UIView?
    
    func push(_ stack: UIView, spacing: CGFloat) {
        attachToLastStack(stack, spacing: spacing)
        
        if stack.frame.width > 0 {
            horizontalLayoutToAlignment(stack)
        } else {
            horizontalLayoutToFill(stack)
        }
        
        extentStackLayout(stack)
    }
    
    private func attachToLastStack(_ stack: UIView, spacing: CGFloat) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        var verticalConstraint = [stack.topAnchor.constraint(equalTo: lastStack?.bottomAnchor ?? topAnchor, constant: spacing)]
        
        if stack.frame.height > 0 {
            verticalConstraint.append(stack.heightAnchor.constraint(equalToConstant: stack.frame.height))
        }
        
        NSLayoutConstraint.activate(verticalConstraint)
        
        lastStack = stack
    }
    
    private func horizontalLayoutToAlignment(_ stack: UIView) {
        var horizontalConstraints = [stack.widthAnchor.constraint(equalToConstant: stack.frame.width)]

        switch contentMode {
        case .center:
            horizontalConstraints.append(stack.centerXAnchor.constraint(equalTo: centerXAnchor))
        case .left:
            horizontalConstraints.append(stack.leadingAnchor.constraint(equalTo: leadingAnchor))
        case .right:
            horizontalConstraints.append(stack.trailingAnchor.constraint(equalTo: trailingAnchor))
            
        default:
            break
        }
        
        NSLayoutConstraint.activate(horizontalConstraints)
    }
    
    private func horizontalLayoutToFill(_ stack: UIView) {
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func extentStackLayout(_ stack: UIView) {
        if let bottom = constraints.first(where: { $0.firstAttribute == .bottom }) {
            NSLayoutConstraint.deactivate([bottom])
        }
        NSLayoutConstraint.activate([bottomAnchor.constraint(equalTo: stack.bottomAnchor)])
    }
}
