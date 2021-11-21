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
        navigationBar.tintColor = .aspasiaPurple
        
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.backgroundColor = .black
        standard.largeTitleTextAttributes = [
            .foregroundColor: UIColor.aspasiaLabelThick
        ]
        standard.titleTextAttributes = [
            .foregroundColor: UIColor.aspasiaLabelThick
        ]
        navigationBar.standardAppearance = standard
        
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.configureWithOpaqueBackground()
        scrollEdge.backgroundColor = .black
        scrollEdge.largeTitleTextAttributes = [
            .foregroundColor: UIColor.aspasiaLabelThick
        ]
        scrollEdge.titleTextAttributes = [
            .foregroundColor: UIColor.aspasiaLabelThick
        ]
        navigationBar.scrollEdgeAppearance = scrollEdge
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}

extension WorkoutNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let showTabbar = viewController is WorkoutHomeViewController
        
        tabBarController?.tabBar.isHidden = !showTabbar
    }
}
