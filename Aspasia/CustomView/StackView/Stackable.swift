//
//  Stackable.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

/// view를 추가할 수록 점점 크기가 커지는 view
protocol Stackable: UIView {
    /// 가장 마지막에 추가한 view
    var lastStack: UIView? { get }
    
    func push(_ stack: UIView, spacing: CGFloat)
}
