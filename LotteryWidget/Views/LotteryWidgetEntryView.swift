//
//  LotteryWidgetEntryView.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import WidgetKit
import SwiftUI

struct LotteryWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: LotteryWidgetProvider.Entry

    var body: some View {
        Group {
            switch family {
            case .systemSmall:
                SmallWidgetView(lottery: entry.lotteries.first ?? .mocks[0])
            case .systemMedium:
                MediumWidgetView(lottery: entry.lotteries.first ?? .mocks[0])
            case .systemLarge:
                LargeWidgetView(lotteries: entry.lotteries)
            default:
                SmallWidgetView(lottery: entry.lotteries.first ?? .mocks[0])
            }
        }
        .widgetURL(URL(string: NetworkConstants.Links.website))
    }
}
