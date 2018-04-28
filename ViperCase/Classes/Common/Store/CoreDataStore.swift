//
//  CoreDataStore.swift
//  case
//
//  Created by towry on 2018/2/27.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import CoreData

typealias DataStoreFetchCompletionBlock<T> = (_ results : Array<T>?)  -> Void

class CoreDataStore {
    var persistentContainer: NSPersistentContainer
    
    init(completeBlock: @escaping () -> ()) {
        let container = NSPersistentContainer(name: "TODO")
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
    
    func fetchEntriesWithPredicate<T: NSManagedObject>(predicate: NSPredicate,
                                   sortDescriptors: Array<T>,
                                   completionBlock: DataStoreFetchCompletionBlock<T>?) {
        print("fetchEntriesWithPredicate")
        
        let fetchRequest = NSFetchRequest<T>(entityName: "TodoItem")
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = nil
        
        self.persistentContainer.viewContext.perform {
            var results: [T]? = nil
            
            do {
                results = try self.persistentContainer.viewContext.fetch(fetchRequest)
            } catch {
                print("err")
            }
            
            if completionBlock != nil {
                completionBlock!(results)
            }
        }
    }
    
    func newTodoItem() -> ManagedTodoItem? {
        let entityDescription = NSEntityDescription.entity(forEntityName: "TodoItem", in: self.persistentContainer.viewContext)
        let newEntry: ManagedTodoItem = ManagedTodoItem(entity: entityDescription!, insertInto: self.persistentContainer.viewContext)
        
        return newEntry
    }
}
