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
    var dataManager: ListDataManager?
    var clock: Clock

    init() {
        self.clock = Clock()
    }

    func findUpcomingItems() {
        let today = self.clock.today
        let endOfNextWeek = Calendar.current.dateForEndOfFollowingWeekWithDate(date: today)

        print("findUpcomingItems")

        self.dataManager?.todoItemsBetweenStartDate(startDate: today, endDate: endOfNextWeek!, completionBlock: { (todoItems: [TodoItem]) -> () in
            self.output?.foundUpcomingItems(upcomingItems: self.upcomingItemsFromTodoItems(todoItems: todoItems))
        })

//        self.output?.foundUpcomingItems(upcomingItems: [])
    }

    func upcomingItemsFromTodoItems(todoItems: [TodoItem]?) -> [UpcomingItem] {
        var validatedTodos: [TodoItem];
        if todoItems == nil {
            validatedTodos = [TodoItem]()
        } else {
            validatedTodos = todoItems!
        }

        let calendar = Calendar.autoupdatingCurrent

        return validatedTodos.map {
            let relation = calendar.nearTermRelationForDate(date: $0.dueDate!, relativeToToday: self.clock.today)
            return UpcomingItem.upcomingItemWithDateRelation(dateRelation: relation, dueDate: $0.dueDate!, title: $0.name!)
        }
    }
}
