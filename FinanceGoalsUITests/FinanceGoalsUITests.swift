//
//  FinanceGoalsUITests.swift
//  FinanceGoalsUITests
//
//  Created by Cooper Hopkins on 6/14/22.
//

import XCTest

class App_Testing: XCTestCase {
    
    private var app: XCUIApplication!
    
    func test() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    
    func test_addGoalButton() throws {
        //Variabls
        let app = XCUIApplication()
        let addGoalButton = app.buttons["Add Goal"]
        let addGoalEnterButton = app.buttons["addGoalEnterButton"]
        let descriptionTextField = app.textFields["description"]
        let amountSavedTextField = app.textFields["amountSaved"]
        let amountTotalTextField = app.textFields["amountTotal"]
        let addingGoalViewText = app.staticTexts["You Have To Refresh The View"]
        //Start
        app.launch()
        //Existence
        XCTAssertTrue(addGoalButton.waitForExistence(timeout: 0.5))
        //Actions
        addGoalButton.tap()
        //Existence
        XCTAssert(addingGoalViewText.waitForExistence(timeout: 0.5))
        XCTAssert(descriptionTextField.waitForExistence(timeout: 0.5))
        XCTAssert(amountSavedTextField.waitForExistence(timeout: 0.5))
        XCTAssert(amountTotalTextField.waitForExistence(timeout: 0.5))
        XCTAssert(addGoalEnterButton.waitForExistence(timeout: 0.5))
        //Button Actions
        addGoalEnterButton.tap()
        //Existence
        XCTAssert(addGoalButton.waitForExistence(timeout: 0.5))
    }
}
