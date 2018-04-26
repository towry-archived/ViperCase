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
        let addWireframe = AddWireframe()
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor()
        let addPresenter = AddPresenter()
        let addInteractor = AddInteractor()
        let addDataManager = AddDataManager()

        listInteractor.output = listPresenter

        listPresenter.listWireframe = listWireframe
        listPresenter.listInteractor = listInteractor

        listWireframe.rootWireframe = rootWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.addWireframe = addWireframe
        
        addInteractor.addDataManager = addDataManager
        addPresenter.addInteractor = addInteractor
        addWireframe.addPresenter = addPresenter
        
        addPresenter.addWireframe = addWireframe
        addPresenter.addModuleDelegate = listPresenter
        
        addDataManager.dataStore = dataStore

        self.listWireframe = listWireframe

        // Add module classes
    }
}
