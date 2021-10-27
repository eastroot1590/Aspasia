//
//  AlertPresentationController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/27.
//

import UIKit

class AlertPresentationController: UIPresentationController {
    let dimmingView: UIView
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView,
              let alertController = presentedViewController as? AspasiaAlertController else {
            return .zero
        }
        
        let height: CGFloat = min(containerView.frame.height * 0.7, alertController.preferredHeight)
        let width: CGFloat = min(height * 1.77778, containerView.frame.width * 0.75)
        let origin: CGPoint = CGPoint(x: containerView.frame.width / 2 - width / 2, y: (containerView.frame.height - height) / 2)
        let size: CGSize = CGSize(width: width, height: height)
        
        return CGRect(origin: origin, size: size)
    }
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        dimmingView = UIView()
        dimmingView.backgroundColor = .label
        dimmingView.alpha = 0
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView,
              let coordinator = presentedViewController.transitionCoordinator else {
            return
        }
        
        dimmingView.frame = containerView.frame
        containerView.insertSubview(dimmingView, at: 0)
        
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.dimmingView.alpha = 0.2
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { [weak self] _ in
                self?.dimmingView.alpha = 0
            }, completion: { [weak self] _ in
                self?.dimmingView.removeFromSuperview()
            })
        } else {
            dimmingView.removeFromSuperview()
        }
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        dimmingView.frame = containerView?.frame ?? .zero
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
}
