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
        view.backgroundColor = .white
        
        let scroll = VStackERScrollView(frame: view.frame)
        scroll.ignoreFirstSpacing = true
        scroll.stackAlignment = .fill
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        for _ in 0 ..< 10 {
            let sampleChart = HomeChartView()
            sampleChart.backgroundColor = .systemBackground
            scroll.push(sampleChart, spacing: 30)
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touch)))
    }
    
    @objc func touch() {
        
    }
}
