//
//  WorkoutCatalogCell.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

protocol WorkoutCatalogCellDelegate: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}

/// 운동 모음을 스크롤로 표현할 수 있는 view
class WorkoutCatalogCell: UITableViewCell {
    
    weak var delegate: WorkoutCatalogCellDelegate?
    
    private var workouts: [Workout] = []
    
    private let titleLabel: UILabel = UILabel()
    
    private lazy var workoutCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
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
        
        workoutCollectionView.backgroundColor = .clear
        workoutCollectionView.dataSource = self
        workoutCollectionView.delegate = self
        workoutCollectionView.alwaysBounceHorizontal = true
        workoutCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(workoutCollectionView)
        NSLayoutConstraint.activate([
            workoutCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            workoutCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            workoutCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            workoutCollectionView.heightAnchor.constraint(equalToConstant: 200),
            workoutCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        workoutCollectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: WorkoutCardCell.identifier)
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

// MARK: UICollectionViewDataSource
extension WorkoutCatalogCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return max(workouts.count, 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let workoutCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCardCell.identifier, for: indexPath) as! WorkoutCardCell
        
        if workouts.count > indexPath.item {
            workoutCardCell.fatch(workouts[indexPath.item])
        } else {
            workoutCardCell.fatch(nil)
        }
        
        return workoutCardCell
    }
    
}

// MARK: UICollectionViewDelegate
extension WorkoutCatalogCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WorkoutCardCell

        UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            cell.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }).startAnimation()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if workouts.isEmpty {
            let workoutGeneratorViewController = WorkoutGeneratorViewController()
            delegate?.pushViewController(workoutGeneratorViewController, animated: true)
        } else {
            let workoutPlayerViewController = WorkoutPlayerViewController()
            delegate?.pushViewController(workoutPlayerViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WorkoutCardCell
        
        UIViewPropertyAnimator(duration: 0.2, dampingRatio: 0.5, animations: {
            cell.transform = .identity
        }).startAnimation()
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension WorkoutCatalogCell: UICollectionViewDelegateFlowLayout {
    
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

        if workouts.count <= 1 {
            let itemHeight = collectionView.frame.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom
            let itemWidth = itemHeight / 1.58
            let horizontalHalfInset = (collectionView.frame.width - itemWidth) / 2
            
            return UIEdgeInsets(top: flowLayout.sectionInset.top, left: horizontalHalfInset, bottom: flowLayout.sectionInset.bottom, right: horizontalHalfInset)
        } else {
            return flowLayout.sectionInset
        }
    }
    
}
