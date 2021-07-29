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
        
        let home = HomeNavigationController(rootViewController: HomeViewController())
        initializeTabAppearance(home, title: "Home")
        
        let other = UIViewController()
        other.view.backgroundColor = .red
        initializeTabAppearance(other, title: "Other")
        
        viewControllers = [home, other]
        setViewControllers(viewControllers, animated: false)
    }
    
    private func initializeTabAppearance(_ viewController: UIViewController, title: String) {
//        viewController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: "\(title)Tab"), selectedImage: UIImage(named: "\(title)Tab"))
        
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .selected)
    }
}
