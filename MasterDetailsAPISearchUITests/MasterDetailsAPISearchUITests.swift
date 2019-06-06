//
//  MasterDetailsAPISearchUITests.swift
//  MasterDetailsAPISearchUITests
//
//  Created by ToqaMohsenon 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import XCTest

class MasterDetailsAPISearchUITests: XCTestCase {

   
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testNavigation() {
        // Use recording to get started writing UI tests.
        let navigateItemRating = "5"
        let app = XCUIApplication()
        app.tables.staticTexts[navigateItemRating].firstMatch.tap()
        app.alerts.buttons["Dismiss"].tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //i don't know why it's slow !!! 
    func testSearchinList() {
        // Use recording to get started writing UI tests.
        let app = XCUIApplication()
        let keyword = "500"
        
        let tablesQuery = app.tables
        tablesQuery.searchFields["Enter search keyword"].tap()
         tablesQuery.searchFields["Enter search keyword"].typeText(keyword)
        XCUIApplication().keyboards.buttons["Search"].tap()
        app/*@START_MENU_TOKEN@*/.tables.containing(.searchField, identifier:"Enter search keyword").element/*[[".tables.containing(.other, identifier:\"2009\").element",".tables.containing(.button, identifier:\"Clear text\").element",".tables.containing(.searchField, identifier:\"Enter search keyword\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["1"]/*[[".cells.staticTexts[\"1\"]",".staticTexts[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
