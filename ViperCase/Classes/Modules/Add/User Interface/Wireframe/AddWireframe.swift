//
//  AddWireframe.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

class AddWireframe: NSObject {
    static let kAddViewControllerIdentifier = "AddViewController"
    
    lazy var mainStoryboard: UIStoryboard = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard
    }()
    
    internal var addPresenter: AddPresenter?
    private var presentedViewController: UIViewController?
    
    func presentAddInterfaceFromViewController(viewController: UIViewController) {
        print("present add")
        let addViewController = self.addViewController()
        addViewController.eventHandler = self.addPresenter;
        addViewController.modalPresentationStyle = .custom
        addViewController.transitioningDelegate = self
        
        self.addPresenter?.configureUserInterfaceForPresentation(addViewUserInterface: addViewController)
        viewController.present(addViewController, animated: true, completion: nil)
        
        self.presentedViewController = viewController
    }
    
    func addViewController() -> AddViewController {
        let storyboard = self.mainStoryboard
        let addViewController: AddViewController = storyboard.instantiateViewController(withIdentifier: AddWireframe.kAddViewControllerIdentifier) as! AddViewController
        return addViewController
    }
    
    func dismissAddInterface() {
        self.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning {
        return AddDismissalTransition()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning {
        return AddPresentationTransition()
    }
}

// MARK: - UIViewControllerTransitioningDelegate methods

extension AddWireframe: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AddDismissalTransition()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AddPresentationTransition()
    }
}
