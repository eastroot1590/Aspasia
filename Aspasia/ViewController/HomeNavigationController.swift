//
//  HomeNavigationController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/07/26.
//

import UIKit

class HomeNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        setNavigationBarHidden(true, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
}

extension HomeNavigationController: UINavigationControllerDelegate {
    
}
