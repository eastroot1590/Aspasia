//
//  ExerciseCollectionViewCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ExerciseCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
