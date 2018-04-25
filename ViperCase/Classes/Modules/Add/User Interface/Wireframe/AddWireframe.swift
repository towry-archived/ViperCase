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
    var addPresenter: AddPresenter?
    private var presentedViewController: UIViewController?
    
    func presentAddInterfaceFromViewController(viewController: UIViewController) {
        let addViewController = self.addViewController()
        addViewController.eventHandler = self.addPresenter;
        addViewController.modalPresentationStyle = .custom
        addViewController.transitioningDelegate = self
        
        self.addPresenter?.configureUserInterfaceForPresentation(addViewUserInterface: addViewController)
        self.presentedViewController = viewController
    }
    
    func addViewController() -> AddViewController {
        let storyboard = self.mainStoryboard
        let addViewController: AddViewController = storyboard.instantiateViewController(withIdentifier: AddWireframe.kAddViewControllerIdentifier) as! AddViewController
        return addViewController
    }
    
    func dismissAddInterface() {
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning {
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning {
        
    }
}

// MARK: - UIViewControllerTransitioningDelegate methods

// TODO: add objects.
extension AddWireframe: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
