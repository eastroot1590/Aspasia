//
//  EmptyWorkoutCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/16.
//

import UIKit

/// 새로 추가하기 카드
class EmptyWorkoutCell: WorkoutCardCell {
    
    let plusImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.text = "새로 추가하기"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        plusImage.layer.cornerRadius = plusImage.frame.width / 2
    }
    
    override func setSelected() {
        guard let workoutNavigationController = rootNavigationController as? WorkoutNavigationController else {
            return
        }
        
        let workoutGeneratorViewController = WorkoutGeneratorViewController()
        workoutNavigationController.pushViewController(workoutGeneratorViewController, animated: true)
    }
}
