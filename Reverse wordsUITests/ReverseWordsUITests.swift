//
//  Reverse_wordsUITests.swift
//  Reverse wordsUITests
//
//  Created by Stanislav Lomakov on 23.04.2023.
//

import XCTest

final class ReverseWordsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let toReverseTextField = app.textFields["Text to reverse"]
        XCTAssertTrue(toReverseTextField.exists)

        toReverseTextField.tap()
        toReverseTextField.typeText("Qwe123!@#  123")

        XCUIApplication().windows.children(matching: .other).element(boundBy: 1).staticTexts["Reverse Words"].tap()

        let reverseButton = app.buttons["Reverse"]
        XCTAssertTrue(reverseButton.exists)
        reverseButton.tap()

//        app.buttons["Clear"].tap()

    }

    func testExample2() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
