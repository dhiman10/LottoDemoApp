//
//  LotteryWidgetEntry.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//


import SwiftUI
import WidgetKit

struct LotteryWidgetEntry: TimelineEntry {
    let date: Date
    let lotteries: [LotteryResponse]
}