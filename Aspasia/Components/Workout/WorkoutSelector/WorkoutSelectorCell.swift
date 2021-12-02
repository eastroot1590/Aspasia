//
//  WorkoutSelectorCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/20.
//

import UIKit

/// 운동 선택 cell
class WorkoutSelectorCell: UICollectionViewCell {
    
    let iconImage = UIImageView()
    let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImage.layer.cornerRadius = 20
        iconImage.layer.cornerCurve = .continuous
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImage.heightAnchor.constraint(equalTo: iconImage.widthAnchor)
        ])
        
        titleLabel.text = "내용"
        titleLabel.textColor = .aspasiaLabel
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatchCategory(_ category: WorkoutCategory) {
        titleLabel.text = category.description
        iconImage.backgroundColor = category.color
    }
    
}
