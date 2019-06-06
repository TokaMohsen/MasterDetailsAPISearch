//
//  MasterDetailsAPISearchTests.swift
//  MasterDetailsAPISearchTests
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import XCTest
@testable import MasterDetailsAPISearch

class MasterDetailsAPISearchTests: XCTestCase {

    var sortedlist: SortList!
    var masterVC: MasterViewController!
    var masterPresnter : MasterPresenter!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        super.setUp()
//
//        masterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MasterViewController") as! MasterViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
