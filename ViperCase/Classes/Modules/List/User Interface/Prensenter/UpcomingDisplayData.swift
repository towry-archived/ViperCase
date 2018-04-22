//
//  UpcomingDisplayData.swift
//  ViperCase
//
//  Created by towry on 2018/3/4.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class UpcomingDisplayData {
    var sections: [UpcomingDisplaySection]
    
    init(sections: [UpcomingDisplaySection]) {
        self.sections = sections
    }
    
    static func upcomingDisplayDataWithSections(sections: [UpcomingDisplaySection]) -> UpcomingDisplayData {
        let data = UpcomingDisplayData(sections: sections)
        
        return data
    }
    
    func isEqualToUpcomingDisplayData(data: UpcomingDisplayData?) -> Bool {
        if data == nil {
            return false
        }
        
        return self.sections == data!.sections
    }
}
