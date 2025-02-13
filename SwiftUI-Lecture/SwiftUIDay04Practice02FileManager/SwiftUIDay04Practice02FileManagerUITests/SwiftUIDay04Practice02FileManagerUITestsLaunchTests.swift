//
//  SwiftUIDay04Practice02FileManagerUITestsLaunchTests.swift
//  SwiftUIDay04Practice02FileManagerUITests
//
//  Created by BEOMJOON KIM on 2025.02.13.
//

import XCTest

final class SwiftUIDay04Practice02FileManagerUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
