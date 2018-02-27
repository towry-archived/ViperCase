//
//  CoreDataStore.swift
//  case
//
//  Created by towry on 2018/2/27.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import CoreData

typealias DataStoreFetchCompletionBlock = (_ results : Array<Any>)  -> Void

class CoreDataStore {
    
    init() {
        
    }
    
    // methods
    func fetchEntriesWithPredicate(predicate: NSPredicate,
                                   sortDescriptors: Array<Any>,
                                   completionBlock: DataStoreFetchCompletionBlock) {
        
    }
    
    func newTodoItem() -> ManagedTodoItem? {
        return nil
    }
}
