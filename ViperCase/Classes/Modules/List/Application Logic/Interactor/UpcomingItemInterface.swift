//
//  UpcomingItemInterface.swift
//  ViperCase
//
//  Created by towry on 2018/4/22.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

protocol UpcomingItemInterface {
    static func upcomingItemWithDateRelation(dateRelation: NearTermDateRelation,
                                             dueDate: Date,
                                             title: String) -> AnyObject
}
