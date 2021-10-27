//
//  AspasiaAlertController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/27.
//

import UIKit

class AspasiaAlertController: UIViewController {
    let contentView = UIView()
    
    let contentInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 15, bottom: -20, right: -15)
    
    // 팝업 높이
    var preferredHeight: CGFloat {
        var height: CGFloat = contentInset.top - contentInset.bottom
        
        if title != nil {
            height += 20 + 20
        }
        
        if message != nil {
            height += messageLabel.textRect(forBounds: view.bounds, limitedToNumberOfLines: 0).height + 20
        }
        
        if lastAlertAction != nil {
            height += 30
        }

        return height
    }
    
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    var message: String?
    
    // 가장 최근에 추가된 액션
    var lastAlertAction: AspasiaAlertAction? = nil
    
    init(title: String?, message: String?) {
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .custom
        
        self.title = title
        self.message = message
        
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.backgroundColor = .systemBackground
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.cornerRadius = 15
        contentView.layer.shadowRadius = 15
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentInset.left),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: contentInset.right),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentInset.top)
        ])
        
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = .label
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func addAction(_ action: AspasiaAlertAction) {
        let space: CGFloat = lastAlertAction == nil ? contentInset.right : -10
        let trailingAnchor = lastAlertAction?.leadingAnchor ?? contentView.trailingAnchor
        
        action.delegate = self
        action.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(action)
        NSLayoutConstraint.activate([
            action.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: contentInset.bottom),
            action.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: space),
            action.heightAnchor.constraint(equalToConstant: 30),
            action.widthAnchor.constraint(equalToConstant: action.width)
        ])
        
        lastAlertAction = action
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            switch traitCollection.userInterfaceStyle {
            case .dark:
                contentView.layer.shadowColor = UIColor.white.cgColor
            case .light:
                contentView.layer.shadowColor = UIColor.black.cgColor
                
            default:
                break
            }
        }
    }
}

extension AspasiaAlertController: AspasiaAlertActionDelegate {
    func alertAction(shouldExecute task: (() -> Void)?) {
        dismiss(animated: true, completion: task)
    }
}

extension AspasiaAlertController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return AlertPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertPresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertDismissAnimator()
    }
}
