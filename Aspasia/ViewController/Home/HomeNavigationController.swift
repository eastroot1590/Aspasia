//
//  HomeNavigationController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/08.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance.backgroundColor = .white
        navigationBar.standardAppearance.shadowColor = .clear
    }
}

extension HomeNavigationController: UINavigationControllerDelegate {
    
}
