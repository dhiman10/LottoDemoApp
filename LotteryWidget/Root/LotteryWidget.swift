//
//  LotteryWidget.swift
//  LotteryWidget
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI
import WidgetKit

struct LotteryWidget: Widget {
    let kind: String = "LotteryWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LotteryWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                LotteryWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                LotteryWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Lottery Numbers")
        .description("View latest lottery numbers and jackpot amounts.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


