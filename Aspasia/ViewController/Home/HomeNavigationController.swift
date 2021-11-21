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
    }
}

extension HomeNavigationController: UINavigationControllerDelegate {
    
}
