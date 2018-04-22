//
//  UpcomingItem.swift
//  ViperCase
//
//  Created by towry on 2018/4/22.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation


class UpcomingItem: UpcomingItemInterface {
    var dateRelation: NearTermDateRelation
    var dueDate: Date
    var title: String
    
    public var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return "\(self.dateRelation) \(dateFormatter.string(from: self.dueDate)) \(self.title)"
    }
    
    init(dateRelation: NearTermDateRelation, dueDate: Date, title: String) {
        self.dateRelation = dateRelation
        self.dueDate = dueDate
        self.title = title
    }
    
    static func upcomingItemWithDateRelation(dateRelation: NearTermDateRelation,
                                             dueDate: Date,
                                             title: String) -> AnyObject {
        return UpcomingItem(dateRelation: dateRelation, dueDate: dueDate, title: title)
    }
    
    static func == (lhs: UpcomingItem, rhs: UpcomingItem) -> Bool {
        return lhs.title == rhs.title && lhs.dateRelation == rhs.dateRelation && lhs.dueDate == rhs.dueDate
    }
}
