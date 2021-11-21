//
//  WorkoutGeneratorViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/10.
//

import UIKit

class WorkoutGeneratorViewController: UIViewController {
    
    var workout: TemplateWorkout = TemplateWorkout()
    
    let templateWorkoutView = TemplateWorkoutView()
    let selectorContainer = UIView()
    
    var currentSelector: WorkoutSelectorViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "새로 만들기"
        
        view.backgroundColor = .black
        
        selectorContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectorContainer)
        NSLayoutConstraint.activate([
            selectorContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectorContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectorContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            selectorContainer.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        templateWorkoutView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(templateWorkoutView)
        NSLayoutConstraint.activate([
            templateWorkoutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            templateWorkoutView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            templateWorkoutView.bottomAnchor.constraint(equalTo: selectorContainer.topAnchor, constant: -10),
            templateWorkoutView.widthAnchor.constraint(equalTo: templateWorkoutView.heightAnchor, multiplier: 0.63)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showSelector(.category)
    }
    
    private func showSelector(_ phase: SelectionPhase) {
        
        guard currentSelector == nil else {
            hideSelector()
            return
        }
        
        let selectorController = WorkoutSelectorViewController(.category)
        addChild(selectorController)
        selectorContainer.addSubview(selectorController.view)
        selectorController.view.frame = selectorContainer.frame
        selectorController.view.frame.origin = CGPoint(x: 0, y: selectorContainer.frame.height)
        
        // animation
        let targetY: CGFloat = 0
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            selectorController.view.frame.origin = CGPoint(x: 0, y: targetY)
        })
        animation.addCompletion { location in
            switch location {
            case .end:
                self.currentSelector = selectorController
                
            default:
                break
            }
        }
        animation.startAnimation()
    }
    
    private func hideSelector() {
        guard let selector = currentSelector else {
            return
        }
        
        let targetY = view.frame.maxY
        
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            selector.view.frame.origin = CGPoint(x: 0, y: targetY)
        })
        animation.addCompletion { location in
            switch location {
            case .end:
                selector.removeFromParent()
                self.currentSelector = nil
                
            default:
                break
            }
        }
        animation.startAnimation()
    }

}
