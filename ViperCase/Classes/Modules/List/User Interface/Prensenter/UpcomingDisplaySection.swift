//
//  UpcomingDisplaySection.swift
//  ViperCase
//
//  Created by towry on 2018/3/5.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class UpcomingDisplaySection {
    private(set) var name: String
    private(set) var imageName: String
    private(set) var items: [UpcomingDisplayItem]
    
    init(name: String, imageName: String, items: [UpcomingDisplayItem]) {
        self.name = name
        self.imageName = imageName
        self.items = items
    }
}

extension UpcomingDisplaySection: Equatable {
    static func == (lhs: UpcomingDisplaySection, rhs: UpcomingDisplaySection) -> Bool {
        return lhs.name == rhs.name &&
        lhs.imageName == rhs.imageName &&
        lhs.items == rhs.items
    }
}

extension UpcomingDisplaySection: Hashable {
    var hashValue: Int {
        return name.hashValue ^ imageName.hashValue
    }
}

