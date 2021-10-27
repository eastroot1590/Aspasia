//
//  AlertTransitionAnimator.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/27.
//

import UIKit

class AlertPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let controller = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        transitionContext.containerView.addSubview(controller.view)
        
        // presenting
        let finalFrame = transitionContext.finalFrame(for: controller)
        controller.view.frame = finalFrame.offsetBy(dx: 0, dy: 500)
        controller.view.transform = CGAffineTransform(scaleX: 0, y: 0)
        controller.view.alpha = 0
        
        // animation
        let animation = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), dampingRatio: 0.75, animations: {
            controller.view.transform = CGAffineTransform.identity
            controller.view.frame = finalFrame
            controller.view.alpha = 1
        })
        animation.addCompletion { position in
            transitionContext.completeTransition(position == .end)
        }
        animation.startAnimation()
    }
}

class AlertDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let controller = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        let finalFrame = transitionContext.finalFrame(for: controller)
        controller.view.frame = finalFrame
        
        let animation = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), dampingRatio: 0.75, animations: {
            controller.view.frame = finalFrame.offsetBy(dx: 0, dy: 500)
            controller.view.alpha = 0
        })
        animation.addCompletion { position in
            transitionContext.completeTransition(position == .end)
        }
        animation.startAnimation()
    }
}
