//
//  LottoListView.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI

struct LotteryCardView: View {
    let lottery: LotteryResponse
    
    var body: some View {
        HStack(spacing: 0) {
            jackpotView
            mainInfoView
        }
        .accessibilityIdentifier("lotteryCard_\(lottery.lottery.lowercased().replacingOccurrences(of: " ", with: ""))")

    }

    // MARK: - Jackpot View (left side)
    private var jackpotView: some View {
        VStack {
            Image(lottery.lottery)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.top, 20)
                .accessibilityIdentifier("lotteryImage_\(lottery.lottery)")
            
            Spacer()

            Text(lottery.nextJackpotDisplay)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(color(for: .text))
                .frame(width: 40, alignment: .center)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .accessibilityIdentifier("jackpotAmount_\(lottery.lottery)")
        }
        .padding(.bottom, 8)
        .background(color(for: .jackpotBackground))
    }

    // MARK: - Main Info View (right side)

    private var mainInfoView: some View {
        VStack(alignment: .leading, spacing: 0) {
            lotteryHeaderView
            lastDrawDateView
            lotteryNumbersView
            nextDrawView
        }
        .background(Color(UIColor.systemBackground))
    }
    
    // MARK: - Lottery Header

    private var lotteryHeaderView: some View {
        HStack(alignment: .top) {
            Text(lottery.displayName)
                .font(.headline)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .accessibilityIdentifier("lotteryName_\(lottery.lottery)")

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                if let spiel77 = lottery.spiel77 {
                    Text("Spiel 77: \(spiel77)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .accessibilityIdentifier("spiel77_\(lottery.lottery)")
                }

                if let super6 = lottery.super6 {
                    Text("SUPER6: \(super6)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .accessibilityIdentifier("super6_\(lottery.lottery)")
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 12)
        .padding(.bottom, 8)
    }
    
    // MARK: - Lottery Numbers View
    private var lotteryNumbersView: some View {
          LotteryNumbersView(
            numbers: lottery.lastDrawNumbers,
            specialNumbers: lottery.specialDrawNumbers
          )
          .padding(.horizontal, 12)
          .padding(.bottom, 24)
          .accessibilityIdentifier("lotteryNumbers_\(lottery.lottery)")
      }



    // MARK: - Last Draw Date

    private var lastDrawDateView: some View {
        Text(lottery.lastDrawDate != nil ? DateFormatter.germanLotteryFormat.string(from: lottery.lastDrawDate!) : "-")
            .font(.headline)
            .foregroundColor(.gray)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding(.horizontal, 12)
            .padding(.bottom, 8)
            .accessibilityIdentifier("lastDrawDate_\(lottery.lottery)")

    }

    // MARK: - Next Draw View

    private var nextDrawView: some View {
        HStack(spacing: 4) {
            Spacer()
            Text("Nächste Ziehungs:")
                .foregroundColor(.secondary)
                .font(.system(size: 14, weight: .semibold))

            Text(lottery.nextDrawDate != nil ? DateFormatter.germanLotteryFormat.string(from: lottery.nextDrawDate!) : "-")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(color(for: .text))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    AngledRectangle(angleOffset: 8)
                        .fill(color(for: .nextDrawBackground))
                )
                .accessibilityIdentifier("nextDrawDate_\(lottery.lottery)")
        }
    }
    
    
}

extension LotteryCardView {
    
    private enum LotteryColorContext {
        case jackpotBackground
        case nextDrawBackground
        case text
    }

    private func color(for context: LotteryColorContext) -> Color {
        let name = lottery.lottery.lowercased()
        
        switch context {
        case .jackpotBackground:
            if name.contains("6aus49") { return Color("mustardYellow") }
            else if name.contains("eurojackpot") { return Color("goldenYellow") }
            else { return Color.yellow }
            
        case .nextDrawBackground:
            if name.contains("6aus49") { return Color("mustardYellow") }
            else if name.contains("eurojackpot") { return Color("chocolate") }
            else { return Color.yellow }
            
        case .text:
            if name.contains("6aus49") { return Color.red }
            else { return Color.yellow }
        }
    }
}


#Preview {
    ScrollView {
        VStack(spacing: 4) {
            ForEach(LotteryResponse.mocks) { lottery in
                LotteryCardView(lottery: lottery)
                    .padding(.horizontal, 4)
            }
        }
    }
    .background(Color(UIColor.systemGray6))
}
