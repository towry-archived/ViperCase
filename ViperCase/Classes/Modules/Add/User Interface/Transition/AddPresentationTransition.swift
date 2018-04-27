//
//  File.swift
//  ViperCase
//
//  Created by towry on 2018/4/25.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import UIKit

class AddPresentationTransition: NSObject {
    
}

extension AddPresentationTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.72
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("animate transition")
        let fromVc = transitionContext.viewController(forKey: .from)
        let toVc: AddViewController = transitionContext.viewController(forKey: .to) as! AddViewController
        
        let blurView: UIImageView = UIImageView(frame: UIScreen.main.bounds)
        blurView.alpha = 0.0
        
        // begine graphics context
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, UIScreen.main.scale)
        fromVc?.view.drawHierarchy(in: UIScreen.main.bounds, afterScreenUpdates: true)
        
        var blurredImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        blurredImage = blurredImage?.applyDarkEffect()
        
        // end context
        UIGraphicsEndImageContext()
        
        blurView.image = blurredImage
        
        toVc.transitioningBackgroundView = blurView
        
        let containerView: UIView = transitionContext.containerView
        containerView.addSubview(blurView)
        containerView.addSubview(toVc.view)
        
        let toViewFrame = CGRect(x: 0.0, y: 0.0, width: 260.0, height: 300.0)
        toVc.view.frame = toViewFrame
        
        let finalCenter = CGPoint(x: (fromVc?.view.bounds.size.width)! / 2, y: 20.0 + toViewFrame.size.height / 2)
        toVc.view.center = CGPoint(x: finalCenter.x, y: finalCenter.y - 1000.0)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.64, initialSpringVelocity: 0.22, options: [UIViewAnimationOptions.curveEaseIn, UIViewAnimationOptions.allowAnimatedContent], animations: {
            
            toVc.view.center = finalCenter
            blurView.alpha = 0.7
            
        }) { (finished) in
            toVc.view.center = finalCenter
            transitionContext.completeTransition(true)
        }
    }
}
