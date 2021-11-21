//
//  WorkoutSelectorCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/20.
//

import UIKit

/// 운동 선택 cell
class WorkoutSelectorCell: UICollectionViewCell {
    
    let cell = UIView()
    let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cell.layer.cornerRadius = 20
        cell.layer.cornerCurve = .continuous
        cell.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cell)
        NSLayoutConstraint.activate([
            cell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        titleLabel.text = "내용"
        titleLabel.textColor = .aspasiaLabel
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatchCategory(_ category: WorkoutCategory) {
        titleLabel.text = category.description
        cell.backgroundColor = category.color
    }
    
}
