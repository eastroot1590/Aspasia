//
//  WorkoutCardCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

/// 운동 카드
class WorkoutCardCell: UICollectionViewCell {
    
    static let identifier: String = "workoutCard"
    
    let iconImage: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let rapsLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .aspasiaPurple
        contentView.layer.cornerRadius = 12
        contentView.layer.cornerCurve = .circular
        contentView.layer.masksToBounds = true
        
        iconImage.layer.cornerRadius = 40
        iconImage.layer.masksToBounds = true
        iconImage.backgroundColor = UIColor(white: 1, alpha: 0.58)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            iconImage.widthAnchor.constraint(equalToConstant: 80),
            iconImage.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        titleLabel.textColor = .aspasiaLabel
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        rapsLabel.textColor = .aspasiaLabelLight
        rapsLabel.font = .systemFont(ofSize: 12)
        rapsLabel.alpha = 0.8
        rapsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rapsLabel)
        NSLayoutConstraint.activate([
            rapsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            rapsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatch(_ data: Workout?) {
        guard let workoutData = data else {
            // empty
            titleLabel.text = "새로 만들기"
            rapsLabel.text = nil
            
            return
        }
        
        titleLabel.text = workoutData.name
        
        rapsLabel.text = "\(workoutData.goalSet[0].weight)kg/\(workoutData.goalSet[0].raps)raps."
    }
    
}
