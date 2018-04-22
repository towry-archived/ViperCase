//
//  UpcomingDisplayItem.swift
//  ViperCase
//
//  Created by towry on 2018/3/6.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class UpcomingDisplayItem {
    private(set) var title: String
    private(set) var dueDay: String
    
    static func upcomingDisplayItemWithTitle(_ title: String, dueDay: String) -> UpcomingDisplayItem {
        let item = UpcomingDisplayItem(title: title, dueDay: dueDay)
        return item
    }
    
    init(title: String, dueDay: String) {
        self.title = title
        self.dueDay = dueDay
    }
}

extension UpcomingDisplayItem: Equatable {
    static func == (lhs: UpcomingDisplayItem, rhs: UpcomingDisplayItem) -> Bool {
        return lhs.title == rhs.title && lhs.dueDay == rhs.dueDay
    }
}
