//
//  UpcomingDisplayDataCollector.swift
//  ViperCase
//
//  Created by towry on 2018/4/23.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class UpcomingDisplayDataCollector {
    typealias Key = Int

    var dayFormatter: DateFormatter = {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: Locale.autoupdatingCurrent)
        return dayFormatter
    }()

    var sections: Dictionary<Key, [UpcomingDisplayItem]> = [Key : [UpcomingDisplayItem]]()

    func addUpcomingItems(upcomingItems: [UpcomingItem]) {
        upcomingItems.forEach { (element) in
            self.addUpcomingItem(upcomingItem: element)
        }
    }

    func addUpcomingItem(upcomingItem: UpcomingItem) {
        let displayItem = self.displayItemForUpcomingItem(upcomingItem: upcomingItem)
        self.addDisplayItem(displayItem: displayItem, withDateRelation: upcomingItem.dateRelation)
    }

    func collectedDisplayData() -> UpcomingDisplayData {
        let displaySections = self.collectedSectionKeys().map {
            return self.displaySectionForKey(sectionKey: $0)
        }
        return UpcomingDisplayData(sections: displaySections)
    }
    
    func displaySectionForKey(sectionKey: Int) -> UpcomingDisplaySection {
        let dateRelation = NearTermDateRelation(rawValue: sectionKey)!
        let sectionTitle = self.sectionTitleForDateRelation(dateRelation: dateRelation)
        let imageName = self.sectionImageNameForDateRelation(dateRelation: dateRelation)
        
        return UpcomingDisplaySection(name: sectionTitle, imageName: imageName, items: self.sections[sectionKey] ?? [])
    }

    func collectedSectionKeys() -> [Key] {
        return self.sections.keys.sorted(by: <)
    }

    func addDisplayItem(displayItem: UpcomingDisplayItem, withDateRelation dateRelation: NearTermDateRelation) {
        var sectionItems: [UpcomingDisplayItem]? = self.sectionItemsForDateRelation(dateRelation: dateRelation)
        sectionItems?.append(displayItem)
    }

    func sectionItemsForDateRelation(dateRelation: NearTermDateRelation) -> [UpcomingDisplayItem]? {
        var sections = self.sections
        var section = sections[dateRelation.rawValue]

        if (section == nil) {
            section = [UpcomingDisplayItem]()
            sections[dateRelation.rawValue] = section
        }

        return section
    }

    func displayItemForUpcomingItem(upcomingItem: UpcomingItem) -> UpcomingDisplayItem {
        let formattedDay = self.formattedDay(date: upcomingItem.dueDate, withDateRelation: upcomingItem.dateRelation)
        return UpcomingDisplayItem.upcomingDisplayItemWithTitle(upcomingItem.title, dueDay: formattedDay)
    }
    
    func formattedDay(date: Date, withDateRelation dateRelation: NearTermDateRelation) -> String {
        return self.needsFormattedDayForDateRelation(dateRelation: dateRelation) ? self.dayFormatter.string(from: date) : ""
    }

    func needsFormattedDayForDateRelation(dateRelation: NearTermDateRelation) -> Bool {
        return dateRelation != .nearTermDateRelationToday
    }
    
    func sectionTitleForDateRelation(dateRelation: NearTermDateRelation) -> String {
        switch dateRelation {
        case .nearTermDateRelationToday:
            return "Today"
        case .nearTermDateRelationTomorrow:
            return "Tomorrow"
        case .nearTermDateRelationLaterThisWeek:
            return "Later This Week"
        case .nearTermDateRelationNextWeek:
            return "Next Week"
        case .nearTermDateRelationOutOfRange:
            return "Unknow"
        }
    }
    
    func sectionImageNameForDateRelation(dateRelation: NearTermDateRelation) -> String {
        switch dateRelation {
        case .nearTermDateRelationToday:
            return "check"
        case .nearTermDateRelationTomorrow:
            return "alarm"
        case .nearTermDateRelationLaterThisWeek:
            return "circle"
        case .nearTermDateRelationNextWeek:
            return "calendar"
        case .nearTermDateRelationOutOfRange:
            return "paper"
        }
    }
}
