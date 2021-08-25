//
//  WorkoutNavigationController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/25.
//

import UIKit

class WorkoutNavigationController: UINavigationController {
    weak var transitioningViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        // dismiss control
        let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleDismiss(_:)))
        recognizer.edges = .left
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func handleDismiss(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        guard let interactiveDelegate = transitioningViewController as? TransitioningInteractable else {
            return
        }
        
        let translate = recognizer.translation(in: recognizer.view)
        let percent = max(0, min(1, translate.x / 100))
        
        switch recognizer.state {
        case .began:
            interactiveDelegate.interactiveDidBegin()
            
        case .changed:
            interactiveDelegate.interactiveDidChange(percent)
            
        case .ended:
            interactiveDelegate.interactiveDidEnd(percent)
            
        case .cancelled:
            interactiveDelegate.interactiveDidCanceled(percent)
            
        default:
            break
        }
    }
    
    /// pan gesture로 뒤로 돌아갈 수 있는 view controller를 push
    func pushInteractivePopableViewController(_ viewController: TransitioningInteractable, animated: Bool = true) {
        transitioningViewController = viewController
        pushViewController(viewController, animated: animated)
    }
    
    /// push/pop transition을 커스텀한 view controller를 push
    func pushCustomTransitioningViewController(_ viewController: TransitioningAnimatable, animated: Bool = true) {
        transitioningViewController = viewController
        pushViewController(viewController, animated: animated)
    }
}

// MARK: UINavigationControllerDelegate
extension WorkoutNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animationDelegate = transitioningViewController as? TransitioningAnimatable else {
            return nil
        }
        
        switch operation {
        case .push:
            return animationDelegate.animatedPushAnimator()
            
        case .pop:
            let result = animationDelegate.animatedPopAnimator()
            return result
            
        default:
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let interactiveDelegate = transitioningViewController as? TransitioningInteractable else {
            return nil
        }
        
        return interactiveDelegate.interactivePopAnimator()
    }
}
