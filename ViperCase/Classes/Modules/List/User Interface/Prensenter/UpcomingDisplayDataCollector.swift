//
//  UpcomingDisplayDataCollector.swift
//  ViperCase
//
//  Created by towry on 2018/4/23.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class UpcomingDisplayDataCollector {
    var sections: Dictionary<String, [UpcomingDisplaySection]>?
    
    func addUpcomingItems(upcomingItems: [UpcomingItem]) {
        upcomingItems.forEach { (element) in
            self.addUpcomingItem(upcomingItem: element)
        }
    }
    
    func addUpcomingItem(upcomingItem: UpcomingItem) {
        print("addUpcomingItem")
    }
    
    func collectedDisplayData() -> UpcomingDisplayData {
//        let displaySections =
        return UpcomingDisplayData(sections: [])
    }
    
    func collectedSectionKeys() -> (Void) {
//        return self.sections?.keys.sorted { $0.localizedCaseInsensitiveCompare($1) == }
    }
    
//    func displayItemForUpcomingItem(upcomingItem: UpcomingItemInterface) -> UpcomingDisplayItem {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//    }
}
