//
//  ListViewInterface.swift
//  case
//
//  Created by towry on 2018/2/22.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

// Describe the List view behavior.
protocol ListViewInterface {
    func showNoContentMessage();
    func showUpcomingDisplayData(_ data: String);
    func reloadEntries();
}
