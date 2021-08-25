//
//  Expandable.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/25.
//

import UIKit

/// ExpandAnimator를 사용할 수 있는 UIView 프로토콜
protocol Expandable: UIView {
    var primeView: UIView { get }
}
