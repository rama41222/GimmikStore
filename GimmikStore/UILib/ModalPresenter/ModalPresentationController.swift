//
//  ModalPresentationController.swift
//  GimmikStore
//
//  Created by Aleksei Cherepanov on 01/10/2019.
//  Copyright © 2019 Viyana. All rights reserved.
//

import UIKit

final class ModalPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame = CGRect.zero
        let bounds = containerView?.bounds ?? .zero
        frame.size = CGSize.init(width: 300, height: 500)
        frame.origin = CGPoint(x: (bounds.width - frame.size.width)/2,
                               y: (bounds.height - frame.size.height)/2)
        return frame
    }
    
    let backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .violet
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func presentationTransitionWillBegin() {
        guard let view = containerView else { return }
        view.insertSubview(backgroundView, at: 0)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            setBackground(alpha: 0.78)
            return
        }
        coordinator.animate(alongsideTransition: { _ in
            self.setBackground(alpha: 0.78)
        })
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            setBackground(alpha: 0)
            return
        }
        coordinator.animate(alongsideTransition: { _ in
            self.setBackground(alpha: 0)
        })
    }
    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        presentedViewController.view.frame = frameOfPresentedViewInContainerView
    }
    
    func setBackground(alpha: CGFloat) {
        backgroundView.alpha = alpha
    }
}

final class ModalTransition: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
