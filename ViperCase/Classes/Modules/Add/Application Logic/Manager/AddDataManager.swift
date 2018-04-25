//
//  AddDataManager.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class AddDataManager {
    var dataStore: CoreDataStore?
    
    func addNewEntry(_ entry: TodoItem) {
        let newEntry = self.dataStore?.newTodoItem()
        newEntry?.name = entry.name
        newEntry?.date = entry.dueDate
        
        self.dataStore?.saveContext()
    }
}
