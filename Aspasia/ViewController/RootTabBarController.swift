//
//  RootTabBarController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/07/26.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        
        let profile = ProfileViewController()
        initializeTabAppearance(profile, title: "프로필")
        
        let workout = WorkoutNavigationController(rootViewController: WorkoutHomeViewController())
        initializeTabAppearance(workout, title: "운동")
        
        viewControllers = [profile, workout]
        setViewControllers(viewControllers, animated: false)
    }
    
    private func initializeTabAppearance(_ viewController: UIViewController, title: String) {
        viewController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .selected)
    }
}
