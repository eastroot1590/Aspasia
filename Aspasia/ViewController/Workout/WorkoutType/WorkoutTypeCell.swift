//
//  WorkoutTypeCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/04.
//

import UIKit

class WorkoutTypeCell: UICollectionViewCell, Expandable {
    var primeView: UIView {
        return contentView
    }
    
    let gradient = CAGradientLayer()
    
    let titleLabel = UILabel()
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
                    self.transform = self.transform.scaledBy(x: 0.9, y: 0.9)
                }).startAnimation()
            }else{
                UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
                    self.transform = .identity
                }).startAnimation()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowPath = CGPath(rect: bounds, transform: nil)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        layer.cornerRadius = 15
        
        backgroundColor = .white
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 15
        
        // 배경 gradient
        gradient.frame = CGRect(origin: .zero, size: frame.size)
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.locations = [0, 0.3, 0.8, 1.3]
        contentView.layer.addSublayer(gradient)
        
        titleLabel.textColor = UIColor(red: 0.9, green: 0.8, blue: 0.9, alpha: 0.8)
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatch(_ data: WorkoutType) {
        contentView.backgroundColor = data.colorCode
        
        titleLabel.text = data.typeName
        
        if let originColor = data.colorCode {
            gradient.colors = [
                originColor.dark.cgColor,
                originColor.cgColor,
                originColor.light.cgColor,
                originColor.dark.cgColor
            ]
        }
    }
}
