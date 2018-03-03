//
//  Array+HOM.swift
//  case
//
//  Created by towry on 2018/3/2.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

extension Array {
    typealias T = Element
    
    func arrayFromObjectsCollectedWithBlock(_ block: (_ object: T) -> T) -> Array<T> {
        return self.map {
            return block($0)
        }
    }
}
