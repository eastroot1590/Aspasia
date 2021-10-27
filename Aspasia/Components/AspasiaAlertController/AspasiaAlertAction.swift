//
//  AspasiaAlertAction.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/27.
//

import UIKit

protocol AspasiaAlertActionDelegate: UIViewController {
    func alertAction(shouldExecute task: (() -> Void)?)
}

class AspasiaAlertAction: UIView {
    weak var delegate: AspasiaAlertActionDelegate?
    
    var task: (() -> Void)?
    
    let titleLabel = UILabel()
    
    var width: CGFloat {
        let count = titleLabel.text?.count ?? 0
        
        return CGFloat(count) * titleLabel.font.pointSize + 30
    }

    init(title: String, task: (() -> Void)? = nil) {
        super.init(frame: .zero)
        
        self.task = task
        
        backgroundColor = .aspasiaPurple
        layer.cornerRadius = 15
        
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        for touch in touches {
            if bounds.contains(touch.location(in: self)) {
                delegate?.alertAction(shouldExecute: task)
                break
            }
        }
    }
}
