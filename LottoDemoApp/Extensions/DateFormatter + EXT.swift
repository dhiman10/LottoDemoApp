//
//  DateFormatter + EXT.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import Foundation
extension DateFormatter {
    static let germanLotteryFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateFormat = "E, dd.MM.yyyy"
        return formatter
    }()
}
