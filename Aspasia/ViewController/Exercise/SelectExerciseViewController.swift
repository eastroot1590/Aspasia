//
//  SelectExerciseViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import UIKit

class SelectExerciseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 50)
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(ExerciseSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExerciseSectionHeader.identifier)
        collectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBlue
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(collectionView)
    }
}

extension SelectExerciseViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let exerciseCell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath)
        
        return exerciseCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let exerciseSectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExerciseSectionHeader.identifier, for: indexPath) as! ExerciseSectionHeader
        
        exerciseSectionHeader.title = "Header"
        
        return exerciseSectionHeader
    }
}
