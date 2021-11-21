//
//  WorkoutHScrollView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/10.
//

import UIKit

/// 운동을 종목별 스크롤로 표현할 수 있는 view
class WorkoutHCollectionView: UICollectionView {
    
    override var intrinsicContentSize: CGSize {
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let height = flowLayout.itemSize.height + flowLayout.sectionInset.top + flowLayout.sectionInset.bottom
            return CGSize(width: super.intrinsicContentSize.width, height: height)
        } else {
            return super.intrinsicContentSize
        }
    }
    
    private let cardWidth: CGFloat = 150
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: cardWidth, height: cardWidth * 1.58)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        alwaysBounceHorizontal = true
        backgroundColor = .black
        
        register(WorkoutCardCell.self, forCellWithReuseIdentifier: "workoutCardCell")
        register(EmptyWorkoutCell.self, forCellWithReuseIdentifier: "emptyWorkoutCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
