//
//  WorkoutTypeViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/24.
//

import UIKit

class WorkoutTypeViewController: UIViewController, TransitioningInteractable {
    var workoutType: WorkoutType
    
    var interactiveTransitioning: Bool = false
    
    var threshold: CGFloat = 0.5
    
    var pushAnimator: UIViewControllerAnimatedTransitioning?
    var popAnimator: UIViewControllerAnimatedTransitioning?
    
    init(_ workoutType: WorkoutType) {
        self.workoutType = workoutType
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = workoutType.colorCode
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTouch)))
    }
    
    @objc func handleTouch() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: TransitioningInteractable
    func interactivePopAnimator() -> UIPercentDrivenInteractiveTransition? {
        guard interactiveTransitioning else {
            return nil
        }
        
        return popAnimator as? UIPercentDrivenInteractiveTransition
    }
    
    func interactiveDidBegin() {
        guard let workoutNavigationController = navigationController as? WorkoutNavigationController else {
            return
        }
        
        interactiveTransitioning = true
        workoutNavigationController.popViewController(animated: true)
    }
    
    func interactiveDidChange(_ percent: CGFloat) {
        guard let interactiveAnimator = popAnimator as? UIPercentDrivenInteractiveTransition else {
            return
        }
        
        interactiveAnimator.update(percent)
    }
    
    func interactiveDidEnd(_ percent: CGFloat) {
        guard let interactiveAnimator = popAnimator as? UIPercentDrivenInteractiveTransition else {
            return
        }
        
        interactiveTransitioning = false
        percent > 0.5 ? interactiveAnimator.finish() : interactiveAnimator.cancel()
    }
    
    func interactiveDidCanceled(_ percent: CGFloat) {
        guard let interactiveAnimator = popAnimator as? UIPercentDrivenInteractiveTransition else {
            return
        }
        
        interactiveTransitioning = false
        interactiveAnimator.cancel()
    }
    
    func animatedPushAnimator() -> UIViewControllerAnimatedTransitioning? {
        pushAnimator
    }
    
    func animatedPopAnimator() -> UIViewControllerAnimatedTransitioning? {
        popAnimator
    }
}
