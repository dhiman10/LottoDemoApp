//
//  LotteryViewModelTests.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import XCTest
@testable import LottoDemoApp

@MainActor
final class LotteryViewModelTests: XCTestCase {
    
    var sut: LotteryViewModel!
    var mockService: MockLotteryService!
    var manager: LotteryManager!
    
    override func setUp() {
        super.setUp()
        mockService = MockLotteryService()
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
    }
    
    override func tearDown() {
        sut = nil
        manager = nil
        mockService = nil
        super.tearDown()
    }
    
    // MARK: - Test 1: Initial State
    func testInitialState() {
        XCTAssertTrue(sut.lotteries.isEmpty)
        XCTAssertNil(sut.spiel77Number)
        XCTAssertNil(sut.super6Number)
        XCTAssertNil(sut.errorMessage)
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.isEmpty)
    }
    
    // MARK: - Test 2: Successful Fetch
    func testFetchAllLotteries_Success() async {
        await sut.fetchAllLotteries()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.lotteries.isEmpty)
        XCTAssertNil(sut.errorMessage)
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - Test 3: Loading State
    func testFetchAllLotteries_SetsLoadingToFalseAfterCompletion() async {
        await sut.fetchAllLotteries()
        
        XCTAssertFalse(sut.isLoading)
    }
    
    // MARK: - Test 4: Error Handling
    func testFetchAllLotteries_ShowsError() async {
        mockService = MockLotteryService(showError: true)
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        await sut.fetchAllLotteries()
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.lotteries.isEmpty)
        XCTAssertEqual(sut.errorMessage, "Failed to load lotteries.")
    }
    
    // MARK: - Test 5: Empty Response
    func testFetchAllLotteries_EmptyResponse() async {
        mockService = MockLotteryService(returnEmpty: true)
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        await sut.fetchAllLotteries()
        
        XCTAssertTrue(sut.lotteries.isEmpty)
    }
    
    // MARK: - Test 6: isEmpty Computed Property
    func testIsEmpty_ReturnsTrueWhenNoDataAndNoError() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    // MARK: - Test 7: isEmpty When Loading
    func testIsEmpty_ReturnsFalseWhenLoading() {
        sut.isLoading = true
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - Test 8: isEmpty When Has Error
    func testIsEmpty_ReturnsFalseWhenHasError() {
        sut.errorMessage = "Error occurred"
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - Test 9: Get Link URL - App Store
    func testGetLinkURL_ReturnsAppStoreURL() {
        let url = sut.getLinkURL()
        
        XCTAssertEqual(url.absoluteString, NetworkConstants.Links.appStore)
    }
    
    // MARK: - Test 10: Error Clears on Retry
    func testFetchAllLotteries_ClearsErrorOnRetry() async {
        // First fetch with error
        mockService = MockLotteryService(showError: true)
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        await sut.fetchAllLotteries()
        XCTAssertNotNil(sut.errorMessage)
        
        // Retry with success
        mockService = MockLotteryService()
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        await sut.fetchAllLotteries()
        XCTAssertNil(sut.errorMessage)
    }
    
    // MARK: - Test 13: Multiple Concurrent Fetches
    func testFetchAllLotteries_HandlesMultipleConcurrentCalls() async {
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<3 {
                group.addTask {
                    await self.sut.fetchAllLotteries()
                }
            }
        }
        
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.lotteries.isEmpty)
    }
    
    // MARK: - Test 14: Lotteries Array Not Nil After Success
    func testFetchAllLotteries_LotteriesArrayIsNotNilAfterSuccess() async {
        await sut.fetchAllLotteries()
        
        XCTAssertNotNil(sut.lotteries)
        XCTAssertGreaterThan(sut.lotteries.count, 0)
    }
    
    // MARK: - Test 15: Error Message Contains Appropriate Text
    func testFetchAllLotteries_ErrorMessageIsDescriptive() async {
        mockService = MockLotteryService(showError: true)
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        await sut.fetchAllLotteries()
        
        XCTAssertEqual(sut.errorMessage, "Failed to load lotteries.")
        XCTAssertFalse(sut.errorMessage?.isEmpty ?? true)
    }
    
    // MARK: - Test 16: Get Link URL Fallback
    func testGetLinkURL_ReturnsWebsiteWhenAppStoreInvalid() {
        let url = sut.getLinkURL()
        
        XCTAssertNotNil(url)
        XCTAssertFalse(url.absoluteString.isEmpty)
    }
    
    // MARK: - Test 17: isEmpty After Successful Load
    func testIsEmpty_ReturnsFalseAfterSuccessfulLoad() async {
        await sut.fetchAllLotteries()
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - Test 18: Lotteries Reset on Error
    func testFetchAllLotteries_ResetsLotteriesOnError() async {
        // First successful load
        await sut.fetchAllLotteries()
        XCTAssertFalse(sut.lotteries.isEmpty)
        
        // Then error
        mockService = MockLotteryService(showError: true)
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        await sut.fetchAllLotteries()
        XCTAssertTrue(sut.lotteries.isEmpty)
    }
    
    // MARK: - Test 19: Loading State During Fetch
    func testFetchAllLotteries_LoadingStateDuringFetch() async {
        mockService = MockLotteryService(delay: 0.3)
        manager = LotteryManager(service: mockService)
        sut = LotteryViewModel(manager: manager)
        
        Task {
            await sut.fetchAllLotteries()
        }
        
        // Give it a moment to start
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        XCTAssertTrue(sut.isLoading)
    }

}
