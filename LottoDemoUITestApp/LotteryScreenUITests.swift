//
//  LotteryScreenUITests.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//
import XCTest

final class SimpleLotteryUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UI_TESTING", "USE_MOCK_DATA"]
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    // MARK: - Test 1: App Launches
    func testAppLaunches() {
        app.launch()
        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 5))
    }
    
    // MARK: - Test 2: Some Content Appears
    func testSomeContentAppears() {
        app.launch()
        
        // Wait for app to load
        let expectation = XCTestExpectation(description: "Wait for content")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 15)
        
        // Check if ANY UI element exists
        let hasAnyScrollView = app.scrollViews.count > 0
        let hasAnyText = app.staticTexts.count > 0
        let hasAnyButton = app.buttons.count > 0
        
        XCTAssertTrue(hasAnyScrollView || hasAnyText || hasAnyButton,
                     "App should show some UI elements")
    }
    
    // MARK: - Test 3: Find Scroll View By Query
    func testFindScrollViewByQuery() {
        app.launch()
        sleep(10) // Wait for loading
        
        // Try to find scroll view by query
        let scrollViews = app.scrollViews
        print("Total scroll views found: \(scrollViews.count)")
        
        if scrollViews.count > 0 {
            let firstScrollView = scrollViews.firstMatch
            XCTAssertTrue(firstScrollView.exists)
        } else {
            // Check for other states
            let allTexts = app.staticTexts.allElementsBoundByIndex
            print("Static texts found: \(allTexts.count)")
            
            for (index, text) in allTexts.prefix(5).enumerated() {
                print("Text \(index): '\(text.label)'")
            }
            
            XCTFail("No scroll view found and no alternative state detected")
        }
    }
    
    // MARK: - Test 4: Wait And Inspect Final State
    func testWaitAndInspectFinalState() {
        app.launch()
        
        // Wait generous amount of time
        sleep(15)
        
        // Inspect what we have
        let scrollViewCount = app.scrollViews.count
        let textCount = app.staticTexts.count
        let buttonCount = app.buttons.count
        let imageCount = app.images.count
        
        print("\n=== FINAL STATE ===")
        print("ScrollViews: \(scrollViewCount)")
        print("StaticTexts: \(textCount)")
        print("Buttons: \(buttonCount)")
        print("Images: \(imageCount)")
        
        // Print first few texts
        let texts = app.staticTexts.allElementsBoundByIndex
        print("\nFirst few texts:")
        for (index, text) in texts.prefix(10).enumerated() {
            print("  [\(index)] '\(text.label)' - identifier: '\(text.identifier)'")
        }
        
        // We should have SOMETHING
        XCTAssertTrue(scrollViewCount > 0 || textCount > 0,
                     "Should have some UI elements")
    }
    
    // MARK: - Test 5: Test With Error State
    func testWithErrorState() {
        app = XCUIApplication()
        app.launchArguments = ["UI_TESTING_NETWORK_ERROR"]
        app.launch()
        
        sleep(5)
        
        // Look for any text containing "error" or "failed"
        let errorTexts = app.staticTexts.allElementsBoundByIndex.filter { text in
            text.label.lowercased().contains("error") ||
            text.label.lowercased().contains("failed") ||
            text.label.lowercased().contains("retry")
        }
        
        print("Found \(errorTexts.count) error-related texts")
        for text in errorTexts {
            print("  - '\(text.label)'")
        }
        
        // Look for retry button
        let retryButton = app.buttons.allElementsBoundByIndex.filter { button in
            button.label.lowercased().contains("retry")
        }
        
        print("Found \(retryButton.count) retry buttons")
        
        XCTAssertTrue(errorTexts.count > 0 || retryButton.count > 0,
                     "Should show error UI")
    }
    
    // MARK: - Test 6: Test With Empty State
    func testWithEmptyState() {
        app = XCUIApplication()
        app.launchArguments = ["UI_TESTING_EMPTY_STATE"]
        app.launch()
        
        sleep(5)
        
        // Look for empty state texts
        let emptyTexts = app.staticTexts.allElementsBoundByIndex.filter { text in
            text.label.lowercased().contains("no data") ||
            text.label.lowercased().contains("empty")
        }
        
        print("Found \(emptyTexts.count) empty state texts")
        for text in emptyTexts {
            print("  - '\(text.label)'")
        }
        
        XCTAssertTrue(emptyTexts.count > 0, "Should show empty state")
    }
    
    // MARK: - Test 7: Test Normal Load Without Args
    func testNormalLoadWithoutArgs() {
        app = XCUIApplication()
        // No special launch arguments
        app.launch()
        
        sleep(10)
        
        // Just verify app is running
        XCTAssertTrue(app.state == .runningForeground)
        
        // Check what we have
        let hasScrollViews = app.scrollViews.count > 0
        let hasTexts = app.staticTexts.count > 0
        
        print("Has scroll views: \(hasScrollViews)")
        print("Has texts: \(hasTexts)")
        
        XCTAssertTrue(hasScrollViews || hasTexts, "Should have some UI")
    }

}
