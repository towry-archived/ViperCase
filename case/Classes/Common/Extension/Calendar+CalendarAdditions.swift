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
        return nil
    }
    
    func dateForEndOfFollowingWeekWithDate(date: Date) {
        
    }
    
    func dateForBeginningOfDay(date: Date) {
        
    }
    
    func dateForEndOfDay(date: Date) {
        
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
