//
//  LotteryServiceProtocol.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI

@MainActor
protocol LotteryService {
    func fetchLotteries(from endpoint: String) async throws -> [LotteryResponse]
}
