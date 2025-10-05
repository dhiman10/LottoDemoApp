//
//  LottoDemoAppApp.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI

@main
struct LottoDemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            LotteryScreen(
                viewModel: createViewModel()
            )
        }
    }
}

// MARK: - ViewModel Factory for Testing

private func createViewModel() -> LotteryViewModel {
    // Check if running UI tests
    let isUITesting = CommandLine.arguments.contains("UI_TESTING")

    // Handle different test scenarios
    if CommandLine.arguments.contains("UI_TESTING_EMPTY_STATE") {
        return LotteryViewModel(
            manager: LotteryManager(service: MockLotteryService(delay: 0.5, returnEmpty: true))
        )
    }

    if CommandLine.arguments.contains("UI_TESTING_NETWORK_ERROR") {
        return LotteryViewModel(
            manager: LotteryManager(service: MockLotteryService(delay: 0.5, showError: true))
        )
    }

    if isUITesting || CommandLine.arguments.contains("USE_MOCK_DATA") {
        return LotteryViewModel(
            manager: LotteryManager(service: MockLotteryService(delay: 0.5))
        )
    }

    // Production: use real network service
    return LotteryViewModel(
        manager: LotteryManager(service: NetworkLotteryService())
    )
}
