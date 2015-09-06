//
//  AddGrocertTestCase.swift
//  GroceryList
//
//  Created by Sarvajeet Gada on 17/08/15.
//  Copyright © 2015 Sarvajeet Gada. All rights reserved.
//

import Foundation
import XCTest

class AddGrocertTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let app = XCUIApplication()
        app.buttons["MSATViewGroceryListButton"].tap()
        app.navigationBars["GroceryList.GroceryListTableView"].buttons["Add"].tap()
        
        let textField = app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.TextField).elementAtIndex(0)
        textField.tap()
        let newList = textField.typeText("Grocerry1")
        app.navigationBars["Add Items"].buttons["Done"].tap()
        app.tables.staticTexts["Grocerry1"].swipeLeft()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(5).childrenMatchingType(.Button).matchingIdentifier("Delete").elementAtIndex(0).tap()
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
