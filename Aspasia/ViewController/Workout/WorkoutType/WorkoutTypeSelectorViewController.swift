//
//  WorkoutBuilderViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/03.
//

import UIKit

class WorkoutTypeSelectorViewController: UIViewController {
    let cellIdentifier: String = "workoutType"
    
    let workoutTypes: [WorkoutType] = [
        WorkoutType(typeName: "유산소", colorCode: AspasiaColor(rawValue: "0xff0000"), description: nil),
        WorkoutType(typeName: "무산소", colorCode: AspasiaColor(rawValue: "0x0000ff"), description: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        let edgeLength = (view.frame.width - 30) / 2
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: edgeLength, height: edgeLength)
        
        let workoutCollection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        workoutCollection.register(WorkoutTypeCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        workoutCollection.backgroundColor = .systemBackground
        workoutCollection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
        view.addSubview(workoutCollection)
    }
}

extension WorkoutTypeSelectorViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        workoutTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WorkoutTypeCollectionViewCell
        
        cell.fatch(workoutTypes[indexPath.item])
        
        return cell
    }
}
