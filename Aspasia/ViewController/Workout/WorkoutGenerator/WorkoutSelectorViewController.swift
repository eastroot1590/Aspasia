//
//  WorkoutSelectorViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/21.
//

import UIKit

protocol WorkoutSelectorDelegate {
    func selectorWillSelect()
}

/// 운동 세부 정보를 선택할 수 있는 view controller
class WorkoutSelectorViewController: UIViewController {

    let titleLabel: UILabel = UILabel()
    
    private var phase: SelectionPhase = .category
    
    private let categories: [WorkoutCategory] = [.aerobic, .anaerobic]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 20
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.backgroundColor = phase.backgroundColor

        titleLabel.text = phase.description
        titleLabel.textColor = .aspasiaLabelThick
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alwaysBounceHorizontal = true
        collectionView.delaysContentTouches = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // register
        collectionView.register(WorkoutSelectorCell.self, forCellWithReuseIdentifier: "categorySelector")
    }

}

extension WorkoutSelectorViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        phase.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let selectorCell = collectionView.dequeueReusableCell(withReuseIdentifier: phase.identifier, for: indexPath) as! WorkoutSelectorCell
        
        switch phase {
        case .category:
            selectorCell.fatchCategory(categories[indexPath.row])
            
        default:
            break
        }
        
        return selectorCell
    }
    
}

extension WorkoutSelectorViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        
        UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            cell.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }).startAnimation()
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            cell.transform = .identity
        }).startAnimation()
    }
    
}

extension WorkoutSelectorViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let edge = (collectionView.frame.height - view.safeAreaInsets.bottom)
        
        return CGSize(width: 80, height: edge)
    }
    
}
