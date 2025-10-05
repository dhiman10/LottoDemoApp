//
//  LotteryManager.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI

@MainActor
class LotteryManager {
    
    private let service: LotteryService
    
    init(service: LotteryService) {
        self.service = service
    }
    
    func fetchMainLotteries() async throws -> [LotteryResponse] {
        try await service.fetchLotteries(from: NetworkConstants.Endpoints.mainLotteries)
    }
    
    func fetchAdditionalLotteries() async throws -> [LotteryResponse] {
        try await service.fetchLotteries(from: NetworkConstants.Endpoints.additionalLotteries)
    }
}
