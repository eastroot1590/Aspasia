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
    
    private var phase: SelectionPhase
    
    private let categories: [WorkoutCategory] = [.aerobic, .anaerobic]
    
    init(_ phase: SelectionPhase) {
        self.phase = phase
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.backgroundColor = .white

        titleLabel.text = phase.description
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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

extension WorkoutSelectorViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let edge = collectionView.frame.width / 4
        
        return CGSize(width: edge, height: edge)
    }
}
