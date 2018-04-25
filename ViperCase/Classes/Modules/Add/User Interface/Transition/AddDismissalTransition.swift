//
//  AddDismissalTransition.swift
//  ViperCase
//
//  Created by towry on 2018/4/25.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import UIKit

class AddDismissalTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.72
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! AddViewController
        
        let finalCenter: CGPoint = CGPoint(x: 160.0, y: (fromVc.view.bounds.size.height) / 2 - 1000.0)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.64, initialSpringVelocity: 0.22, options: [UIViewAnimationOptions.curveEaseIn, UIViewAnimationOptions.allowAnimatedContent], animations: { () -> Void in
                fromVc.view.center = finalCenter
                fromVc.transitioningBackgroundView?.alpha = 0.0
            }, completion: { (finished) -> Void in
                fromVc.view.removeFromSuperview()
                transitionContext.completeTransition(true)
            })
    }
}
