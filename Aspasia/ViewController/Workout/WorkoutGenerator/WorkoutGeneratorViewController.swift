//
//  WorkoutGeneratorViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/10.
//

import UIKit

class WorkoutGeneratorViewController: UIViewController {
    
    var workout: TemplateWorkout = TemplateWorkout()
    
    /// 현재 만들어지고 있는 운동을 표시하는 카드
    let templateWorkoutView = TemplateWorkoutView()
    /// selector가 들어갈 자리
    let selectorContainer = UIView()
    var selectorTopConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var selectorAnimation: UIViewPropertyAnimator?
    
    var currentSelector: WorkoutSelectorViewController = WorkoutSelectorViewController(.category)

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
            selectorContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
        
        addChild(currentSelector)
        selectorContainer.addSubview(currentSelector.view)
        currentSelector.view.frame = selectorContainer.frame
        
        templateWorkoutView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(templateWorkoutView)
        selectorTopConstraint = templateWorkoutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        NSLayoutConstraint.activate([
            selectorTopConstraint,
            templateWorkoutView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            templateWorkoutView.bottomAnchor.constraint(equalTo: selectorContainer.topAnchor, constant: -20),
            templateWorkoutView.widthAnchor.constraint(equalTo: templateWorkoutView.heightAnchor, multiplier: 0.63)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showSelector(.category)
    }
    
    private func showSelector(_ phase: SelectionPhase) {
//        selectorAnimation?.startAnimation()
    }

}
