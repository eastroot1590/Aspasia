//
//  WorkoutCollectionViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import UIKit

class WorkoutCollectionViewController: UIViewController {
    let workoutParts: [WorkoutPart] = [.chest, .back, .shoulder, .arm, .core, .leg]

    override func viewDidLoad() {
        super.viewDidLoad()

        // collection layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 30)
        layout.itemSize = CGSize(width: (view.frame.width - 40) / 2, height: 100)
        
        // collection view
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(WorkoutSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WorkoutSectionHeader.identifier)
        collectionView.register(WorkoutCollectionViewCell.self, forCellWithReuseIdentifier: WorkoutCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(collectionView)
    }
}

extension WorkoutCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // section
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WorkoutSectionHeader.identifier, for: indexPath) as! WorkoutSectionHeader
        
        sectionHeader.title = "운동 부위 선택"
        
        return sectionHeader
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        workoutParts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let workoutCell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCollectionViewCell.identifier, for: indexPath) as! WorkoutCollectionViewCell
        
        if indexPath.item < workoutParts.count {
            workoutCell.title = workoutParts[indexPath.item].rawValue
        }
        
        return workoutCell
    }
}
