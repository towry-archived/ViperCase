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
        let fromVc = transitionContext.viewController(forKey: .from)
        let toVc: AddViewController = transitionContext.viewController(forKey: .to) as! AddViewController
        
        let blurView: UIImageView = UIImageView(frame: UIScreen.main.bounds)
        blurView.alpha = 0.0
        
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, UIScreen.main.scale)
        fromVc?.view.drawHierarchy(in: UIScreen.main.bounds, afterScreenUpdates: true)
        
        var blurredImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
//        blurredImage = blurredImage?.
    }
}
