//
//  AppDependencies.swift
//  case
//
//  Created by towry on 2018/2/17.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

final class AppDependencies {
    var listWireframe: ListWireframe?
    var dataStore: CoreDataStore?
    
    init() {
        self.configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        self.listWireframe?.presentListInterfaceFrom(window: window)
    }
    
    func configureDependencies() {
        // Root level classes
        let rootWireframe = RootWireframe()
        
        // List modules classes
        let listWireframe = ListWireframe()
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor()
        
        listInteractor.output = listPresenter
        
        listPresenter.listWireframe = listWireframe
        listPresenter.listInteractor = listInteractor
        
        listWireframe.rootWireframe = rootWireframe
        listWireframe.listPresenter = listPresenter
        self.listWireframe = listWireframe
        
        // Add module classes
    }
}
