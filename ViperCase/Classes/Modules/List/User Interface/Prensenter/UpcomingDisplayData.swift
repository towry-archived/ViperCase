//
//  UpcomingDisplayData.swift
//  ViperCase
//
//  Created by towry on 2018/3/4.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class UpcomingDisplayData<T> where T: Equatable {
    private(set) var sections: Array<T>?
    
    static func upcomingDisplayDataWithSections(sections: Array<T>) -> UpcomingDisplayData {
        let data = UpcomingDisplayData()
        data.sections = sections
        
        return data
    }
    
    func isEqualToUpcomingDisplayData(data: UpcomingDisplayData?) -> Bool {
        if data == nil {
            return false
        }
        
        return self.sections! == data!.sections!
    }
}
