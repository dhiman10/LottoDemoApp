
//
//  MockLotteryService.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 04.10.25.
//

import Foundation

@MainActor
class MockLotteryService: LotteryService {
    private let delay: Double
    private let showError: Bool
    private let returnEmpty: Bool
    
    init(delay: Double = 1.0, showError: Bool = false, returnEmpty: Bool = false) {
        self.delay = delay
        self.showError = showError
        self.returnEmpty = returnEmpty
    }
    
    private func tryShowError() throws {
        if showError {
            throw URLError(.unknown)
        }
    }

    func fetchLotteries(from endpoint: String) async throws -> [LotteryResponse] {
        try tryShowError()
           
        if delay > 0 {
            try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        }
        
        if returnEmpty {
            return []
        }
           
        return LotteryResponse.mocks
    }
}
