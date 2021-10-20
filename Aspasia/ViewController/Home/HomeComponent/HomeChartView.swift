//
//  HomeChartView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/08.
//

import UIKit

/// 차트를 그리는 홈 컴포넌트
class HomeChartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.text = "Hello World"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        let dummy = UIView()
        dummy.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dummy)
        NSLayoutConstraint.activate([
            dummy.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            dummy.leadingAnchor.constraint(equalTo: leadingAnchor),
            dummy.trailingAnchor.constraint(equalTo: trailingAnchor),
            dummy.heightAnchor.constraint(equalToConstant: 150),
            dummy.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
