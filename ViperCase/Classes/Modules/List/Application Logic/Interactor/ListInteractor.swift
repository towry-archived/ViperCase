//
//  ListInteractor.swift
//  ViperCase
//
//  Created by towry on 2018/4/21.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorInput {
    weak var output: ListInteractorOutput?
    
    func findUpcomingItems() {
        print("findUpcomingItems")
        self.output?.foundUpcomingItems(upcomingItems: [])
    }
}
