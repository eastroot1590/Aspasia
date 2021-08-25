//
//  ExpandAnimator.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/25.
//

import UIKit

class ExpandAnimator: UIPercentDrivenInteractiveTransition {
    let selectedCell: Expandable
    let originFrame: CGRect
    
    init(selectedCell: Expandable, originFrame: CGRect) {
        self.selectedCell = selectedCell
        self.originFrame = originFrame
    }
}
