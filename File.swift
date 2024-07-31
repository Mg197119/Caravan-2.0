//
//  File.swift
//  Caravan
//
//  Created by Mason Gill on 3/28/24.
//

import Foundation
import UIKit

class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else {
            return .zero
        }
        
        let containerBounds = containerView.bounds
        let halfHeight = containerBounds.height / 2
        return CGRect(x: 0, y: halfHeight, width: containerBounds.width, height: halfHeight)
    }
}
func presentHalfScreenModal() {
    let modalViewController = UIViewController() // Replace with your custom view controller
    modalViewController.modalPresentationStyle = .custom
    modalViewController.transitioningDelegate = self
    present(modalViewController, animated: true, completion: nil)
}

// Conform to UIViewControllerTransitioningDelegate
extension YourPresentingViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}
