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
    
    func presentListInterfaceFrom(window: UIWindow) {
        let listViewController: ListViewController? = self.listViewControllerFromStoryboard()
        listViewController?.eventHandler = self.listPresenter!
        self.listPresenter?.userInterface = listViewController
        
        self.rootWireframe?.showRootViewController(viewController: listViewController, inWindow: window)
    }
    
    func presentAddInterface() {
        
    }
    
    private func listViewControllerFromStoryboard() -> ListViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: ListViewController? = storyboard.instantiateViewController(withIdentifier: ListWireframe.ListViewControllerIdentifier) as? ListViewController
        return controller
    }
}
