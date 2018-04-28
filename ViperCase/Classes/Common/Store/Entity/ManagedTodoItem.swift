//
//  ManagedTodoItem.swift
//  case
//
//  Created by towry on 2018/2/27.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import CoreData

// https://stackoverflow.com/a/26614152/796919

//@objc(TodoItem)
class ManagedTodoItem : NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var date: Date?
}
