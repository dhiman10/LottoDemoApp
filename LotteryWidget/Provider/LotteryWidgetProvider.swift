//
//  LotteryWidgetProvider.swift
//  LotteryWidget
//
//  Created by Dhiman Das on 05.10.25.
//

import WidgetKit
import SwiftUI

struct LotteryWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> LotteryWidgetEntry {
        LotteryWidgetEntry(date: Date(), lotteries: LotteryResponse.mocks)
    }

    func getSnapshot(in context: Context, completion: @escaping (LotteryWidgetEntry) -> Void) {
        let entry = LotteryWidgetEntry(date: Date(), lotteries: LotteryResponse.mocks)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<LotteryWidgetEntry>) -> Void) {
        Task {
            let manager = await LotteryManager(service: NetworkLotteryService())

            do {
                var lotteries = try await manager.fetchMainLotteries()

                // Fetch additional for Spiel77/Super6
                if let additional = try? await manager.fetchAdditionalLotteries() {
                    let s77 = additional.first(where: { $0.lottery.lowercased().contains("spiel77") })?.lastDraw?.drawResult.number
                    let s6 = additional.first(where: { $0.lottery.lowercased().contains("super6") })?.lastDraw?.drawResult.number

                    for i in lotteries.indices {
                        if lotteries[i].lottery.lowercased().contains("6aus49") {
                            lotteries[i].spiel77 = s77
                            lotteries[i].super6 = s6
                        }
                    }
                }

                let entry = LotteryWidgetEntry(date: Date(), lotteries: lotteries)
                let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
                completion(timeline)

            } catch {
                fallbackTimeline(completion: completion)
            }
        }
    }

    private func fallbackTimeline(completion: @escaping (Timeline<LotteryWidgetEntry>) -> Void) {
        let entry = LotteryWidgetEntry(date: Date(), lotteries: LotteryResponse.mocks)
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }
}
// MARK: - TimeInterval Extension

private extension TimeInterval {
    static func hour(_ hours: Int) -> TimeInterval {
        TimeInterval(hours)
    }
}
