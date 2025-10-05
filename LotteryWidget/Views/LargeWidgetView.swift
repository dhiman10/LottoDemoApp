//
//  LargeWidgetView.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI
import WidgetKit

struct LargeWidgetView: View {
    let lotteries: [LotteryResponse]

    var body: some View {
        LotteryListView(lotteries: lotteries)
    }
}

struct LotteryListView: View {
    let lotteries: [LotteryResponse]
    let maxItems: Int = .max

    var body: some View {
        VStack(spacing: 0) {
            ForEach(lotteries.prefix(maxItems)) { lottery in
                LotteryCardView(lottery: lottery)
                if lottery.id != lotteries.prefix(maxItems).last?.id {
                    Divider()
                }
            }
        }
    }
}
