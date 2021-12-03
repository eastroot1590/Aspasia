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
    
    var currentSelector: WorkoutSelectorViewController = WorkoutSelectorViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "새로 만들기"
        
        view.backgroundColor = .black
        
//        selectorContainer.frame = CGRect(x: 0, y: view.frame.maxY - view.safeAreaInsets.bottom, width: view.frame.width, height: 250)
        selectorContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectorContainer)
        selectorTopConstraint = selectorContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([
            selectorTopConstraint,
            selectorContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectorContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectorContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        addChild(currentSelector)
        selectorContainer.addSubview(currentSelector.view)
        currentSelector.view.frame = selectorContainer.frame
        
        templateWorkoutView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(templateWorkoutView)
        NSLayoutConstraint.activate([
            templateWorkoutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            templateWorkoutView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            templateWorkoutView.bottomAnchor.constraint(equalTo: selectorContainer.topAnchor, constant: -20),
            templateWorkoutView.widthAnchor.constraint(equalTo: templateWorkoutView.heightAnchor, multiplier: 0.63)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showSelector()
    }
    
    private func showSelector() {
        UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: { [weak self] in
            self?.selectorTopConstraint.constant = -200
            self?.view.layoutIfNeeded()
        }).startAnimation()
    }

}
