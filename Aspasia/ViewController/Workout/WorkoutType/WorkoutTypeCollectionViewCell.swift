//
//  WorkoutTypeCollectionViewCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/04.
//

import UIKit

class WorkoutTypeCollectionViewCell: UICollectionViewCell {
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.textColor = .label
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatch(_ data: WorkoutType) {
        contentView.backgroundColor = data.colorCode.uiColor
        
        titleLabel.text = data.typeName
    }
}
