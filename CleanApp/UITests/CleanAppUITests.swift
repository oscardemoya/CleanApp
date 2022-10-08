//
//  CleanAppUITests.swift
//  CleanAppUITests
//
//  Created by Oscar De Moya on 5/10/22.
//

import XCTest

final class CleanAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
