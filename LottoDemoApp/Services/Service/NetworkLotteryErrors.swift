//
//  NetworkLotteryErrors.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import Foundation

enum NetworkLotteryErrors: LocalizedError {
    case badURL
    case badResponse(statusCode: Int)
    case noData
    case decodingFailed
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "The URL is invalid."
        case .badResponse(let statusCode):
            return "Server returned an invalid response. Status code: \(statusCode)"
        case .noData:
            return "No data was returned from the server."
        case .decodingFailed:
            return "Failed to decode the response from the server."
        case .unknown(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        }
    }
}
