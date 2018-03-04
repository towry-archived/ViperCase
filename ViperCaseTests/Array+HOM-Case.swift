//
//  Array+HOM-Case.swift
//  ViperCaseTests
//
//  Created by towry on 2018/3/3.
//  Copyright © 2018年 towry. All rights reserved.
//

import XCTest
@testable import ViperCase

class Array_HOM_Case: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let originalArray: Array<Int> = [1,2,3,4,5,6,7]
        let newArray = originalArray.arrayFromObjectsCollectedWithBlock { item in
            return item + 1
        }
        
        XCTAssert(newArray[0] == 2)
        XCTAssert(newArray[newArray.count - 1] == 7 + 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
