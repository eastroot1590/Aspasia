//
//  WorkoutCatalogCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

class WorkoutCatalogCell: UITableViewCell {
    
    var workoutCollectionView: UICollectionView!
    
    var catalog: Catalog = Catalog(category: .newWorkout, title: "새로 만들기", workouts: [])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 200)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        workoutCollectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)
        workoutCollectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: "workoutCardCell")
        workoutCollectionView.dataSource = self
        workoutCollectionView.delegate = self
        workoutCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(workoutCollectionView)
        NSLayoutConstraint.activate([
            workoutCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            workoutCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            workoutCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            workoutCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatch(_ data: Catalog) {
        catalog = data
        
        workoutCollectionView.reloadData()
    }
}

extension WorkoutCatalogCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        catalog.workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workoutCardCell", for: indexPath) as! WorkoutCardCell
        
        return cell
    }

}
