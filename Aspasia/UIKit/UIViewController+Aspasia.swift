//
//  UIViewController+Aspasia.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/25.
//

import UIKit

// MARK: protocol
/// 화면 전환 효과를 커스텀 한 UIViewController
protocol TransitioningAnimatable: UIViewController {
    var pushAnimator: UIViewControllerAnimatedTransitioning? { get set }
    var popAnimator: UIViewControllerAnimatedTransitioning? { get set }
    
    func animatedPushAnimator() -> UIViewControllerAnimatedTransitioning?
    func animatedPopAnimator() -> UIViewControllerAnimatedTransitioning?
}

/// pan gesture로 화면 전환효과를 줄 수 있는 UIViewController
protocol TransitioningInteractable: TransitioningAnimatable {
    var interactiveTransitioning: Bool { get }
    
    var threshold: CGFloat { get }
    
    func interactivePopAnimator() -> UIPercentDrivenInteractiveTransition?
    
    func interactiveDidBegin()
    func interactiveDidChange(_ percent: CGFloat)
    func interactiveDidEnd(_ percent: CGFloat)
    func interactiveDidCanceled(_ percent: CGFloat)
}
