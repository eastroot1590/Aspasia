//
//  WorkoutCatalogCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

class WorkoutCatalogCell: UITableViewCell {
    
    var workouts: [Workout] = []
    
    let titleLabel: UILabel = UILabel()
    var workoutCollectionView: UICollectionView!
    
    var cellAnimationForCurrentSession: UIViewPropertyAnimator?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        
        workoutCollectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)
        workoutCollectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: "workoutCardCell")
        workoutCollectionView.dataSource = self
        workoutCollectionView.delegate = self
        workoutCollectionView.allowsSelection = true
        workoutCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(workoutCollectionView)
        NSLayoutConstraint.activate([
            workoutCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            workoutCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            workoutCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            workoutCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            workoutCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 230)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatch(_ data: Catalog) {
        workouts = data.workouts
        titleLabel.text = data.title
        
        workoutCollectionView.reloadData()
    }
}

extension WorkoutCatalogCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workoutCardCell", for: indexPath) as! WorkoutCardCell
        
        cell.fatch(workouts[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WorkoutCardCell
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }).startAnimation()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WorkoutCardCell
        
        cell.setSelected()
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WorkoutCardCell
        
        UIViewPropertyAnimator(duration: 0.2, dampingRatio: 0.5, animations: {
            cell.transform = .identity
        }).startAnimation()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let height = collectionView.frame.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom
        
        return CGSize(width: height * 0.7, height: height)
    }
}
