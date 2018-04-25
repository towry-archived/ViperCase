//
//  AddPresenter.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class AddPresenter: AddModuleInterface {
    var addInteractor: AddInteractor?
    var addWireframe: AddWireframe?
    var addModuleDelegate: AddModuleDelegate?
    
    func configureUserInterfaceForPresentation<O: AddViewInterface>(addViewUserInterface: O) {
        addViewUserInterface.setMinimumDueDate(date: Date())
    }
    
    func cancelAddAction() {
        self.addWireframe?.dismissAddInterface()
        self.addModuleDelegate?.addModuleDidCancelAddAction()
    }
    
    func saveAddActionWithName(name: String, dueDate: Date) {
        self.addInteractor?.saveNewEntryWithName(name: name, dueDate: dueDate)
        self.addWireframe?.dismissAddInterface()
        self.addModuleDelegate?.addModuleDidSaveAddAction()
    }
}
