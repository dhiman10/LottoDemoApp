//
//  NetworkConstants.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//
import SwiftUI

struct NetworkConstants {
    static let baseURL = "https://www.lotto24.de/public/v1/drawinfo/aggregated"
    
    struct Endpoints {
        static let lotto6aus49 = "\(baseURL)/6aus49"
        static let eurojackpot = "\(baseURL)/eurojackpot"
        static let spiel77 = "\(baseURL)/Spiel77"
        
        static let additionalLotteries = "\(baseURL)/spiel77,super6"
        static let allLotteries = "\(baseURL)/6aus49,eurojackpot,super6,spiel77"
        static let mainLotteries = "\(baseURL)/6aus49,eurojackpot"

    }
    
    struct Links {
         static let website = "https://www.lotto24.de/"
         static let appStore = "https://apps.apple.com/app/id784389203"
     }
}
