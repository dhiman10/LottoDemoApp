//
//  MediumWidgetView.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import WidgetKit
import SwiftUI

struct MediumWidgetView: View {
    let lottery: LotteryResponse

    var body: some View {
        HStack(spacing: 0) {
            // Left side - Logo and Jackpot
            VStack(spacing: 8) {
                Image(lottery.lottery)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)

                Spacer()

                Text(lottery.nextJackpotDisplay)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .frame(maxWidth: 30)
            }
            .frame(width: 40)
            .padding(.vertical, 12)
            .background(Color("mustardYellow"))

            // Right side - Info
            VStack(alignment: .leading, spacing: 8) {
                Text(lottery.displayName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(lottery.lastDrawDate != nil ? DateFormatter.germanLotteryFormat.string(from: lottery.lastDrawDate!) : "-")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                if !lottery.lastDrawNumbers.isEmpty {
                    HStack(spacing: 3) {
                        ForEach(lottery.lastDrawNumbers.prefix(6), id: \.self) { num in
                            Text("\(num)")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.primary)
                                .frame(width: 22, height: 22)
                                .background(
                                    Circle()
                                        .fill(Color(UIColor.secondarySystemBackground))
                                )
                        }
                    }
                }

                nextDrawView
            }
            .padding(.leading, 12)
            .padding(.vertical, 12)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }

    private var nextDrawView: some View {
        HStack(spacing: 4) {
            Spacer()
            Text("Nächste Ziehungs:")
                .foregroundColor(.secondary)
                .font(.system(size: 12, weight: .semibold))
                .minimumScaleFactor(0.8)

            Text(lottery.nextDrawDate != nil ? DateFormatter.germanLotteryFormat.string(from: lottery.nextDrawDate!) : "-")
                .font(.system(size: 12, weight: .semibold))
                .minimumScaleFactor(0.8)
                .foregroundColor(Color.red)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    AngledRectangle(angleOffset: 8)
                        .fill(Color.yellow)
                )
        }
    }
}
