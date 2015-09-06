//
//  GroceryListUITests.swift
//  GroceryListUITests
//
//  Created by Sarvajeet Gada on 29/06/15.
//  Copyright © 2015 Sarvajeet Gada. All rights reserved.
//

import Foundation
import XCTest

class GroceryListUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testAddButtonOnNavigationBarIsNotNil() {
        let app = XCUIApplication()
        app.buttons["MSATViewGroceryListButton"].tap()
        let tableViewNavigationBar = app.navigationBars["GroceryList.GroceryListTableView"]
        XCTAssertNotNil(tableViewNavigationBar.buttons["Add"])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

