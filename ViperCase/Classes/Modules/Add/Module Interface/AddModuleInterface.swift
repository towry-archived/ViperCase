//
//  AddModuleInterface.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

protocol AddModuleInterface {
    func cancelAddAction()
    func saveAddActionWithName(name: String, dueDate: Date)
}
