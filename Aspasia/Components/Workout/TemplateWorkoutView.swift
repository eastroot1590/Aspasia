//
//  TemplateWorkoutView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/20.
//

import UIKit

/// 운동 만들기에 사용하는 빈 운동 view
class TemplateWorkoutView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 15
        layer.cornerCurve = .continuous
        layer.masksToBounds = true
        
        layer.borderColor = CGColor(gray: 1, alpha: 0.38)
        layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWorkoutCategory(_ category: WorkoutCategory) {
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.fillColor = category.color.cgColor
        
        let ardCenter: CGPoint = CGPoint(x: bounds.width * 0.7, y: bounds.height * 0.7)
        let targetRadius: CGFloat = bounds.height * 2
        
        let path = UIBezierPath(arcCenter: ardCenter, radius: 0, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        backgroundLayer.path = path.cgPath
        
        layer.addSublayer(backgroundLayer)
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            let newPath = UIBezierPath(arcCenter: ardCenter, radius: targetRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
            
            backgroundLayer.path = newPath.cgPath
        }).startAnimation()
    }
    
}
