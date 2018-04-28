//
//  AddInteractor.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class AddInteractor {
    var addDataManager: AddDataManager?
    
    func saveNewEntryWithName(name: String, dueDate: Date) {
        let item = TodoItem(name: name, dueDate: dueDate)
        self.addDataManager?.addNewEntry(item)
    }
}
