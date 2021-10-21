//
//  WorkoutNavigationController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

class WorkoutNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance.backgroundColor = .white
        navigationBar.standardAppearance.shadowColor = .clear
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}

extension WorkoutNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is WorkoutHomeViewController {
            setNavigationBarHidden(false, animated: true)
            tabBarController?.tabBar.isHidden = false
        } else {
            setNavigationBarHidden(true, animated: true)
            tabBarController?.tabBar.isHidden = true
        }
    }
}
