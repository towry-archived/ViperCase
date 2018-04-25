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
    var listPresenter: ListPresenter?
    var addWireframe: AddWireframe?
    var listViewController: UIViewController?
    
    func presentListInterfaceFrom(window: UIWindow) {
        let listViewController: ListViewController? = self.listViewControllerFromStoryboard()
        listViewController?.eventHandler = self.listPresenter!
        self.listViewController = listViewController
        self.listPresenter?.userInterface = listViewController
        
        self.rootWireframe?.showRootViewController(viewController: listViewController, inWindow: window)
    }
    
    func presentAddInterface() {
        guard let listViewController = self.listViewController else {
            print("nil")
            return
        }
        
        self.addWireframe?.presentAddInterfaceFromViewController(viewController: listViewController)
    }
    
    private func listViewControllerFromStoryboard() -> ListViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: ListViewController? = storyboard.instantiateViewController(withIdentifier: ListWireframe.ListViewControllerIdentifier) as? ListViewController
        return controller
    }
}
