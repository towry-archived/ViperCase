//
//  ListPresenter.swift
//  ViperCase
//
//  Created by towry on 2018/4/21.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: ListModuleInterface {
    var listInteractor: ListInteractorInput?
    var listWireframe: ListWireframe?
    var userInterface: ListViewInterface?
    
    func updateView() {
        
        self.listInteractor?.findUpcomingItems()
    }
    
    func addNewEntry() {
        print("addNewEntry")
        self.listWireframe?.presentAddInterface()
    }
}

extension ListPresenter: ListInteractorOutput {
    func foundUpcomingItems(upcomingItems: [UpcomingItem]) {
        if (upcomingItems.count == 0) {
            print("no items")
            return (self.userInterface?.showNoContentMessage())!
        }
        
        self.updateUserInterfaceWithUpcomingItems(upcomingItems: upcomingItems)
    }
    
    func updateUserInterfaceWithUpcomingItems(upcomingItems: [UpcomingItem]) {
        self.userInterface?.showUpcomingDisplayData(self.upcomingDisplayDataWithItems(upcomingItems: upcomingItems))
    }
    
    func upcomingDisplayDataWithItems(upcomingItems: [UpcomingItem]) -> UpcomingDisplayData {
        let collector = UpcomingDisplayDataCollector()
        collector.addUpcomingItems(upcomingItems: upcomingItems)
        
        return collector.collectedDisplayData()
    }
}
