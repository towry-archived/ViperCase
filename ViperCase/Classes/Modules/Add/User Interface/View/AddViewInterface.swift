//
//  AddViewInterface.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

protocol AddViewInterface {
    func setEntryName(name: String)
    func setEntryDueDate(date: Date)
    func setMinimumDueDate(date: Date)
}
