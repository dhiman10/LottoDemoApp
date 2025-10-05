//
//  LotteryService 2.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//
import SwiftUI

@MainActor
class NetworkLotteryService: LotteryService {
    func fetchLotteries(from endpoint: String) async throws -> [LotteryResponse] {
        guard let url = URL(string: endpoint) else {
            throw NetworkLotteryErrors.badURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200 ... 299).contains(httpResponse.statusCode)
            {
                throw NetworkLotteryErrors.badResponse(statusCode: httpResponse.statusCode)
            }
            
            guard !data.isEmpty else {
                throw NetworkLotteryErrors.noData
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let lotteries = try decoder.decode([LotteryResponse].self, from: data)
            return lotteries
            
        } catch let error as URLError {
            throw NetworkLotteryErrors.unknown(error)
        } catch {
            throw NetworkLotteryErrors.unknown(error)
        }
    }
}
