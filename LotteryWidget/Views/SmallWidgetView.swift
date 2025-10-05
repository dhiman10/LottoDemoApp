//
//  SmallWidgetView.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import WidgetKit
import SwiftUI

// MARK: - Small Widget View

struct SmallWidgetView: View {
    let lottery: LotteryResponse

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 8) {
                Image(lottery.lottery)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Spacer()

                Text(lottery.nextJackpotDisplay)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .frame(maxWidth: 20)
            }
            .frame(width: 30)
            .padding(.vertical, 8)
            .background(Color("mustardYellow"))

            VStack(alignment: .leading, spacing: 8) {
                Text(lottery.displayName)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.6)
                    .lineLimit(1)

                Spacer()

                Text("Nächste Ziehungs:")
                    .foregroundColor(.secondary)
                    .font(.system(size: 10, weight: .semibold))
                    .minimumScaleFactor(0.6)
                Text(lottery.nextDrawDate != nil ? DateFormatter.germanLotteryFormat.string(from: lottery.nextDrawDate!) : "-")
                    .font(.system(size: 12, weight: .semibold))
                    .minimumScaleFactor(0.8)
                    .foregroundColor(Color.red)
            }
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemBackground))
        }
    }
}

// MARK: - Previews

#Preview(as: .systemSmall) {
    LotteryWidget()
} timeline: {
    LotteryWidgetEntry(date: .now, lotteries: LotteryResponse.mocks)
}

#Preview(as: .systemMedium) {
    LotteryWidget()
} timeline: {
    LotteryWidgetEntry(date: .now, lotteries: LotteryResponse.mocks)
}

#Preview(as: .systemLarge) {
    LotteryWidget()
} timeline: {
    LotteryWidgetEntry(date: .now, lotteries: LotteryResponse.mocks)
}
