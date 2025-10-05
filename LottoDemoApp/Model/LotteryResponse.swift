//
//  LotteryResponse.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import Foundation

// MARK: - Top-level response
struct LotteryResponse: Codable, Identifiable {
    var id = UUID()
    let lottery: String
    let lastDraw: Draw?
    let nextDraw: NextDraw?
    let draws: [Draw]?
    
    var spiel77: String?
    var super6: String?
    
    private enum CodingKeys: String, CodingKey {
        case lottery, lastDraw, nextDraw, draws, spiel77, super6
    }
    
    var drawNumbers: [Int] {
        lastDraw?.drawResult.numbers ?? []
    }
    
    var nextJackpotDisplay: String {
        nextDraw?.jackpot?.formattedJackpot ?? "-"
    }
    
    var lastDrawNumbers: [Int] {
        lastDraw?.drawResult.numbers ?? []
    }
    
    var lastDrawDate: Date? {
        lastDraw?.drawDate
    }
        var nextDrawDate: Date? {
        nextDraw?.drawDate
    }
    
    var displayName: String {
        if lottery.contains("6aus49") {
            return "Lotto \(lottery)".capitalized
        } else {
            return lottery.capitalized
        }
    }
    
    var specialDrawNumbers: [Int] {
        guard let drawResult = lastDraw?.drawResult else { return [] }
        
        if lottery.contains("6aus49"), let superNum = drawResult.superNumber {
            return [superNum]
        } else if lottery.contains("eurojackpot"), let euroNums = drawResult.euroNumbers {
            return euroNums
        } else {
            return []
        }
    }
}

// MARK: - Draw
struct Draw: Codable {
    let drawIdentifier: String
    let lottery: String
    let drawDate: Date
    let drawDateUtc: Date
    let drawResult: DrawResult
    let quotas: [String: String]?
    let nonMonetaryQuotas: [String: String]?
    let winners: [String: Int]?
    let totalStake: String?
    let currency: String?

    
}

// MARK: - DrawResult
struct DrawResult: Codable {
    let numbers: [Int]?
    let number: String?
    let superNumber: Int?
    let euroNumbers: [Int]?
}

// MARK: - NextDraw
struct NextDraw: Codable {
    let drawIdentifier: String
    let lottery: String
    let drawDate: Date
    let drawDateUtc: Date
    let timeZone: String?
    let cutofftime: String?
    let jackpot: Jackpot?
    
}

// MARK: - Jackpot
struct Jackpot: Codable {
    let drawIdentifier: String
    let lottery: String
    let drawDate: Date
    let currency: String?
    let jackpots: [String: String]?
    let jackpotSupported: Bool?
    
    var formattedJackpot: String {
        guard let wc1 = jackpots?["WC_1"], let value = Double(wc1) else {
            return "-"
        }
        return formatValue(value)
    }
    
    private func formatValue(_ value: Double) -> String {
        if value >= 1_000_000 {
            let millions = value / 1_000_000
            return String(format: "%.0f MIO", millions)
        } else {
            return String(format: "%.0f", value)
        }
    }
}

