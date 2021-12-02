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
        
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.configureWithOpaqueBackground()
        tabbarAppearance.backgroundColor = .black
        tabBar.standardAppearance = tabbarAppearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabbarAppearance
        }
        tabBar.tintColor = .aspasiaPurple
        
        let home = HomeNavigationController(rootViewController: HomeViewController())
        appendTab(home, title: "홈", icon: UIImage(systemName: "house.fill"))
        
        let workout = WorkoutNavigationController(rootViewController: WorkoutHomeViewController())
        appendTab(workout, title: "운동", icon: UIImage(systemName: "house.fill"))
        
        viewControllers = [home, workout]
        setViewControllers(viewControllers, animated: false)
    }
    
    private func appendTab(_ viewController: UIViewController, title: String? = nil, icon: UIImage? = nil) {
        viewController.tabBarItem = UITabBarItem(title: title, image: icon, selectedImage: icon)
        
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 12)], for: .selected)
    }
}
