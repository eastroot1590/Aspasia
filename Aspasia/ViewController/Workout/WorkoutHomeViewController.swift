//
//  WorkoutBuilderViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/03.
//

import UIKit

class WorkoutHomeViewController: UIViewController {
    let cellIdentifier: String = "workoutType"
    
    let workoutTypes: [WorkoutType] = [
        WorkoutType(typeName: "유산소", colorCode: UIColor(code: "0x4396f3"), description: nil),
        WorkoutType(typeName: "무산소", colorCode: UIColor(code: "0xd12727"), description: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.backgroundColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let edge = (view.frame.width - 40) / 2
        layout.itemSize = CGSize(width: edge, height: edge)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        let workoutCollection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        workoutCollection.register(WorkoutTypeCell.self, forCellWithReuseIdentifier: cellIdentifier)
        workoutCollection.backgroundColor = .systemBackground
        workoutCollection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
        view.addSubview(workoutCollection)
    }
}

extension WorkoutHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        workoutTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WorkoutTypeCell
        
        cell.fatch(workoutTypes[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? WorkoutTypeCell,
              let workoutNavigationController = navigationController as? WorkoutNavigationController else {
            return
        }
        
        let workoutTypeViewController = WorkoutTypeViewController(workoutTypes[indexPath.item])
        let originFrame = selectedCell.convert(selectedCell.primeView.frame, to: workoutNavigationController.view)
        
        workoutTypeViewController.pushAnimator = ExpandPushAnimator(selectedCell: selectedCell, originFrame: originFrame)
        workoutTypeViewController.popAnimator = ExpandPopAnimator(selectedCell: selectedCell, originFrame: originFrame)
        
        workoutNavigationController.pushInteractivePopableViewController(workoutTypeViewController, animated: true)
    }
}
