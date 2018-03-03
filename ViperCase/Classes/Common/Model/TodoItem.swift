//
//  TodoItem.swift
//  case
//
//  Created by towry on 2018/2/26.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class TodoItem {
    var name: String?
    var dueDate: Date?
    
    required init(name: String, dueDate: Date) {
        self.name = name
        self.dueDate = dueDate
    }
    
    static func todoItemWithDueDate(_ dueDate: Date, name: String) -> TodoItem {
        let item = TodoItem(name: name, dueDate: dueDate)
        return item
    }
}
