//
//  WorkoutCatalogCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

/// 운동 모음을 스크롤로 표현할 수 있는 view
class CatalogTableCell: UITableViewCell {
    
    private var workouts: [Workout] = []
    
    private let titleLabel: UILabel = UILabel()
    private let workoutHCollectionView = WorkoutHCollectionView()
    
    private var cellAnimationForCurrentSession: UIViewPropertyAnimator?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        
        selectionStyle = .none
        
        titleLabel.textColor = .aspasiaLabel
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        workoutHCollectionView.dataSource = self
        workoutHCollectionView.delegate = self
        workoutHCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(workoutHCollectionView)
        NSLayoutConstraint.activate([
            workoutHCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            workoutHCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            workoutHCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            workoutHCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fatch(_ data: Catalog) {
        workouts = data.workouts
        titleLabel.text = data.title
        
        workoutHCollectionView.reloadData()
    }
}

// MARK: UICollectionViewDataSource
extension CatalogTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return max(workouts.count, 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard workouts.count > 0 else {
            let emptyWorkoutCell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyWorkoutCell", for: indexPath) as! EmptyWorkoutCell
            
            return emptyWorkoutCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workoutCardCell", for: indexPath) as! WorkoutCardCell
        
        cell.fatch(workouts[indexPath.item])
        
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension CatalogTableCell: UICollectionViewDelegate {
    
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
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension CatalogTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let height = collectionView.frame.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom
        let width = height / 1.58
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        if workouts.count == 1 {
            let left = (collectionView.frame.width - flowLayout.itemSize.width) / 2
            return UIEdgeInsets(top: 10, left: left, bottom: 20, right: left)
        } else {
            return flowLayout.sectionInset
        }
    }
    
}
