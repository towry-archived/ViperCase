//
//  ListWireframe.swift
//  case
//
//  Created by towry on 2018/2/26.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

class ListWireframe {
    static let ListViewControllerIdentifier = "ListViewController";
    var rootWireframe: RootWireframe?
    
    func presentListInterfaceFrom(window: UIWindow) {
        let listViewController: ListViewController? = self.listViewControllerFromStoryboard()
        
        self.rootWireframe?.showRootViewController(viewController: listViewController, inWindow: window)
    }
    
    private func listViewControllerFromStoryboard() -> ListViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: ListViewController? = storyboard.instantiateViewController(withIdentifier: ListWireframe.ListViewControllerIdentifier) as? ListViewController
        return controller
    }
}
