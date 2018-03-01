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
    
    func todoItemsBetweenStartDate(startDate: Date, endDate: Date, completionBlock: (_ todoItems: Array<Any>) -> ()) {
        let cal = Calendar.autoupdatingCurrent
        let predicate = NSPredicate(format: "(date >= %@) AND (date <= %@")
        // TODO
    }
    
    private func todoItemsFromDataStoreEntries(entries: Array<Any>) {
        
    }
}
