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
    var persistentContainer: NSPersistentContainer
    
    init(completeBlock: @escaping () -> ()) {
        let container = NSPersistentContainer(name: "case")
        container.loadPersistentStores(completionHandler: {(description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            completeBlock()
        })
        
        self.persistentContainer = container
    }
    
    // methods
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchEntriesWithPredicate(predicate: NSPredicate,
                                   sortDescriptors: Array<Any>,
                                   completionBlock: DataStoreFetchCompletionBlock) {
        
    }
    
    func newTodoItem() -> ManagedTodoItem? {
        return nil
    }
}
