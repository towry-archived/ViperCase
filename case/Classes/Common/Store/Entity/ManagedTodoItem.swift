//
//  ManagedTodoItem.swift
//  case
//
//  Created by towry on 2018/2/27.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import CoreData

class ManagedTodoItem : NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var date: Date?
}
