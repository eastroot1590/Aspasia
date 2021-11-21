//
//  HomeViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/08.
//

import UIKit
import StackERView

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "홈"
        
        
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.aspasiaLabel]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.aspasiaLabel]
        
        view.backgroundColor = .black
    }
    
    @objc func touch() {
        
    }
}
