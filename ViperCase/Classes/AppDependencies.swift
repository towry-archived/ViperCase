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

    init(_ dataStore: CoreDataStore?) {
        self.dataStore = dataStore
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
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor()
        let addPresenter = AddPresenter()
        let addInteractor = AddInteractor()
        let addDataManager = AddDataManager()
        
        listDataManager.dataStore = self.dataStore
        
        listInteractor.output = listPresenter
        listInteractor.dataManager = listDataManager

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
