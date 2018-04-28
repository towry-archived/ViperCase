//
//  Calendar+CalendarAdditions.swift
//  case
//
//  Created by towry on 2018/3/1.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

extension Calendar {
    func dateWithYear(year: Int, month: Int, day: Int) -> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = 12
        
        return self.date(from: components)
    }
    
    func dateForEndOfWeekWithDate(date: Date) -> Date? {
        let daysRemainingThisWeek = self.daysRemainingInWeekWithDate(date)
        var remainingDaysComponent = DateComponents()
        remainingDaysComponent.day = daysRemainingThisWeek
        
        return self.date(byAdding: remainingDaysComponent, to: date)
    }
    
    func dateForEndOfFollowingWeekWithDate(date: Date) -> Date? {
        guard let endOfWeek = self.dateForEndOfWeekWithDate(date: date) else {
            return nil
        }
        
        var nextWeekComponent = DateComponents()
        nextWeekComponent.weekday = 1
        
        return self.date(byAdding: nextWeekComponent, to: endOfWeek)
    }
    
    func daysRemainingInWeekWithDate(_ date: Date) -> Int {
        let weekdayComponent = self.component(Calendar.Component.weekday, from: date)
        let daysRange = self.range(of: Calendar.Component.weekday, in: Calendar.Component.weekday, for: date)
        let daysPerWeek = (daysRange?.count ?? Optional(0))!
        
        return daysPerWeek - weekdayComponent
    }
    
    func dateForBeginningOfDay(date: Date) -> Date? {
        let components = self.dateComponents([
            Calendar.Component.year,
            Calendar.Component.month,
            Calendar.Component.day], from: date)
        
        return self.date(from: components)
    }
    
    func dateForEndOfDay(date: Date) -> Date? {
        var dayComponent = DateComponents()
        dayComponent.day = 1
        
        guard let beginDay = self.dateForBeginningOfDay(date: date) else {
            return nil
        }
        
        let nextDay = self.date(byAdding: dayComponent, to: beginDay)
        
        return nextDay?.addingTimeInterval(-1)
    }
    
    func isDate(date1: Date, beforeYearMonthDay date2: Date) -> Bool {
        return false
    }
    
    func isDate(date1: Date, equalToYearMonthDay date2: Date) -> Bool {
        return false
    }
    
    func nearTermRelationForDate(date: Date, relativeToToday today: Date) -> NearTermDateRelation {
        return .nearTermDateRelationLaterThisWeek
    }
}
