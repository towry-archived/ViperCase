//
//  ListInteractorIO.swift
//  ViperCase
//
//  Created by towry on 2018/4/21.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

protocol ListInteractorInput: class {
    func findUpcomingItems()
}

protocol ListInteractorOutput: class {
    func foundUpcomingItems(upcomingItems: [UpcomingItem])
}
