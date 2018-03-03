//
//  RootWireframe.swift
//  case
//
//  Created by towry on 2018/2/26.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

class RootWireframe {
    func showRootViewController(viewController: UIViewController?, inWindow window: UIWindow) {
        guard let viewController = viewController else {
            return
        }
        
        let navigatorController: UINavigationController? = self.navigatorControllerFrom(window: window)
        navigatorController?.viewControllers = [viewController]
    }
    
    private func navigatorControllerFrom(window: UIWindow) -> UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
}
