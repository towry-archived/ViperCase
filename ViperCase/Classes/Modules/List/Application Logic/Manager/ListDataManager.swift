//
//  ListDataManager.swift
//  case
//
//  Created by towry on 2018/2/28.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

typealias ListDataManagerFetchEntriesBlock = () -> Array<Any>

class ListDataManager {
    var dataStore: CoreDataStore?
    
    init() {
        
    }
    
    func todoItemsBetweenStartDate(startDate: Date, endDate: Date, completionBlock: ((_ todoItems: Array<TodoItem>) -> ())? = nil) {
        let cal = Calendar.autoupdatingCurrent
        
        guard let endOfDay = cal.dateForEndOfDay(date: endDate),
            let beginOfDay = cal.dateForBeginningOfDay(date: startDate) else {
            return
        }
        
        let predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)", argumentArray: [endOfDay, beginOfDay])
        let sortDescriptors: Array<ManagedTodoItem> = [ManagedTodoItem]()
        
        // weak self ?
        self.dataStore?.fetchEntriesWithPredicate(predicate: predicate, sortDescriptors: sortDescriptors) { (results: Array<ManagedTodoItem>?) -> Void in
            if let completionBlock = completionBlock {
                completionBlock(self.todoItemsFromDataStoreEntries(entries: results))
            }
        }
    }
    
    private func todoItemsFromDataStoreEntries(entries: Array<ManagedTodoItem>?) -> Array<TodoItem> {
//        return entries.block
        return entries!.arrayFromObjectsCollectedWithBlock { item in
            return TodoItem.todoItemWithDueDate(item.date!, name: item.name!)
        }
    }
}
