//
//  MockData.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 06.10.25.
//

import Foundation

extension LotteryResponse {
    
    static var mocks: [LotteryResponse] {
        [
            LotteryResponse(
                lottery: "6aus49",
                lastDraw: Draw(
                    drawIdentifier: "2025-10-01",
                    lottery: "6aus49",
                    drawDate: ISO8601DateFormatter().date(from: "2025-10-01T18:25:00+02:00") ?? Date(),
                    drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-01T16:25:00Z") ?? Date(),
                    drawResult: DrawResult(
                        numbers: [9, 12, 14, 32, 37, 41],
                        number: nil,
                        superNumber: 1,
                        euroNumbers: nil
                    ),
                    quotas: [
                        "WC_1": "20754461.40", "WC_2": "735720.10", "WC_3": "10319.50",
                        "WC_4": "2956.50", "WC_5": "213.40", "WC_6": "43.60",
                        "WC_7": "25.10", "WC_8": "10.70", "WC_9": "6.00"
                    ],
                    nonMonetaryQuotas: [:],
                    winners: [
                        "WC_1": 0, "WC_2": 5, "WC_3": 47, "WC_4": 489,
                        "WC_5": 1879, "WC_6": 21815, "WC_7": 32221,
                        "WC_8": 356783, "WC_9": 233454
                    ],
                    totalStake: "25242445.20",
                    currency: "EUR"
                ),
                nextDraw: NextDraw(
                    drawIdentifier: "2025-10-04",
                    lottery: "6aus49",
                    drawDate: ISO8601DateFormatter().date(from: "2025-10-04T19:25:00+02:00") ?? Date(),
                    drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-04T17:25:00Z") ?? Date(),
                    timeZone: "Europe/Berlin",
                    cutofftime: "2025-10-04T18:45:00+02:00",
                    jackpot: Jackpot(
                        drawIdentifier: "2025-10-04",
                        lottery: "6aus49",
                        drawDate: ISO8601DateFormatter().date(from: "2025-10-04T19:25:00+02:00") ?? Date(),
                        currency: "EUR",
                        jackpots: ["WC_1": "24000000.00", "WC_2": "2000000.00"],
                        jackpotSupported: true
                    )
                ),
                draws: [],
                spiel77: "7312244",
                super6: "112430"
            ),
            
            // Eurojackpot
            LotteryResponse(
                lottery: "eurojackpot",
                lastDraw: Draw(
                    drawIdentifier: "2025-09-30",
                    lottery: "eurojackpot",
                    drawDate: ISO8601DateFormatter().date(from: "2025-09-30T21:00:00+03:00") ?? Date(),
                    drawDateUtc: ISO8601DateFormatter().date(from: "2025-09-30T18:00:00Z") ?? Date(),
                    drawResult: DrawResult(
                        numbers: [8, 11, 13, 24, 27],
                        number: nil,
                        superNumber: nil,
                        euroNumbers: [3, 7]
                    ),
                    quotas: [
                        "WC_1": "0.00", "WC_2": "231846.00", "WC_3": "60346.30",
                        "WC_4": "1725.30", "WC_5": "159.60", "WC_6": "65.40",
                        "WC_7": "65.40", "WC_8": "12.70", "WC_9": "12.70",
                        "WC_10": "12.70", "WC_11": "7.60", "WC_12": "7.60"
                    ],
                    nonMonetaryQuotas: [:],
                    winners: [
                        "WC_1": 0, "WC_2": 6, "WC_3": 13, "WC_4": 75,
                        "WC_5": 1013, "WC_6": 2920, "WC_7": 1778,
                        "WC_8": 33838, "WC_9": 35566, "WC_10": 67333,
                        "WC_11": 144198, "WC_12": 430161
                    ],
                    totalStake: "32350618.00",
                    currency: "EUR"
                ),
                nextDraw: NextDraw(
                    drawIdentifier: "2025-10-03",
                    lottery: "eurojackpot",
                    drawDate: ISO8601DateFormatter().date(from: "2025-10-03T21:00:00+03:00") ?? Date(),
                    drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-03T18:00:00Z") ?? Date(),
                    timeZone: "Europe/Helsinki",
                    cutofftime: "2025-10-03T19:35:00+03:00",
                    jackpot: Jackpot(
                        drawIdentifier: "2025-10-03",
                        lottery: "eurojackpot",
                        drawDate: ISO8601DateFormatter().date(from: "2025-10-03T21:00:00+03:00") ?? Date(),
                        currency: "EUR",
                        jackpots: ["WC_1": "28000000.00", "WC_2": "1000000.00"],
                        jackpotSupported: true
                    )
                ),
                draws: []
            ),
            
        ]
    }
    
    // MARK: - Additional Mock Lotteries (Spiel77 & Super6)
        static var additionalMocks: [LotteryResponse] {
            [
                // Super6
                LotteryResponse(
                    lottery: "super6",
                    lastDraw: Draw(
                        drawIdentifier: "2025-10-01",
                        lottery: "super6",
                        drawDate: ISO8601DateFormatter().date(from: "2025-10-01T18:25:00+02:00") ?? Date(),
                        drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-01T16:25:00Z") ?? Date(),
                        drawResult: DrawResult(numbers: nil, number: "378857", superNumber: nil, euroNumbers: nil),
                        quotas: [
                            "WC_1": "100000.00",
                            "WC_2": "6666.00",
                            "WC_3": "666.00",
                            "WC_4": "66.00",
                            "WC_5": "6.00",
                            "WC_6": "2.50"
                        ],
                        nonMonetaryQuotas: [:],
                        winners: [
                            "WC_1": 1, "WC_2": 23, "WC_3": 183, "WC_4": 2106,
                            "WC_5": 20885, "WC_6": 207018
                        ],
                        totalStake: "2296425.00",
                        currency: "EUR"
                    ),
                    nextDraw: NextDraw(
                        drawIdentifier: "2025-10-04",
                        lottery: "super6",
                        drawDate: ISO8601DateFormatter().date(from: "2025-10-04T19:25:00+02:00") ?? Date(),
                        drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-04T17:25:00Z") ?? Date(),
                        timeZone: "Europe/Berlin",
                        cutofftime: nil,
                        jackpot: nil
                    ),
                    draws: []
                ),
                
                // Spiel77
                LotteryResponse(
                    lottery: "spiel77",
                    lastDraw: Draw(
                        drawIdentifier: "2025-10-01",
                        lottery: "spiel77",
                        drawDate: ISO8601DateFormatter().date(from: "2025-10-01T18:25:00+02:00") ?? Date(),
                        drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-01T16:25:00Z") ?? Date(),
                        drawResult: DrawResult(numbers: nil, number: "2243327", superNumber: nil, euroNumbers: nil),
                        quotas: [
                            "WC_1": "3777777.00",
                            "WC_2": "77777.00",
                            "WC_3": "7777.00",
                            "WC_4": "777.00",
                            "WC_5": "77.00",
                            "WC_6": "17.00",
                            "WC_7": "5.00"
                        ],
                        nonMonetaryQuotas: [:],
                        winners: [
                            "WC_1": 1, "WC_2": 2, "WC_3": 27, "WC_4": 224,
                            "WC_5": 2422, "WC_6": 23659, "WC_7": 240503
                        ],
                        totalStake: "5271362.50",
                        currency: "EUR"
                    ),
                    nextDraw: NextDraw(
                        drawIdentifier: "2025-10-04",
                        lottery: "spiel77",
                        drawDate: ISO8601DateFormatter().date(from: "2025-10-04T19:25:00+02:00") ?? Date(),
                        drawDateUtc: ISO8601DateFormatter().date(from: "2025-10-04T17:25:00Z") ?? Date(),
                        timeZone: "Europe/Berlin",
                        cutofftime: nil,
                        jackpot: Jackpot(
                            drawIdentifier: "2025-10-04",
                            lottery: "spiel77",
                            drawDate: ISO8601DateFormatter().date(from: "2025-10-04T19:25:00+02:00") ?? Date(),
                            currency: "EUR",
                            jackpots: ["WC_1": "700000.00"],
                            jackpotSupported: true
                        )
                    ),
                    draws: []
                )
            ]
        }
    

}
