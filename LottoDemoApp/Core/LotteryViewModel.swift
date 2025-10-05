//
//  LotteryViewModel.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//

import SwiftUI

@Observable
@MainActor
class LotteryViewModel {
    var lotteries: [LotteryResponse] = []
    var spiel77Number: String?
    var super6Number: String?
    var errorMessage: String?
    var isLoading: Bool = false

    private let manager: LotteryManager
    
    init(manager: LotteryManager) {
        self.manager = manager
    }
    
    // MARK: - Derived state

    var isEmpty: Bool {
        return lotteries.isEmpty && !isLoading && errorMessage == nil
    }
    
    func getLinkURL() -> URL {
        if let appStoreURL = URL(string: NetworkConstants.Links.appStore) {
            return appStoreURL
        }
        
        return URL(string: NetworkConstants.Links.website)!
    }

    func openLink() {
        let url = getLinkURL()
        #if os(iOS)
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        #endif
    }

    
    func fetchAllLotteries() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        async let mainResult = try? manager.fetchMainLotteries()
        async let additionalResult = try? manager.fetchAdditionalLotteries()

        let main = await mainResult
        let additional = await additionalResult

        if let main = main {
            lotteries = main
        } else {
            lotteries = []
        }
        
        if let additional = additional {
            if let s77 = additional.first(where: { $0.lottery.lowercased().contains("spiel77") })?.lastDraw?.drawResult.number {
                spiel77Number = s77
            }

            if let s6 = additional.first(where: { $0.lottery.lowercased().contains("super6") })?.lastDraw?.drawResult.number {
                super6Number = s6
            }

            for i in lotteries.indices {
                if lotteries[i].lottery.lowercased().contains("6aus49") {
                    lotteries[i].spiel77 = spiel77Number
                    lotteries[i].super6 = super6Number
                }
            }
        }

        if lotteries.isEmpty && main == nil && additional == nil {
            errorMessage = "Failed to load lotteries."
        }
        
      //  LotteryDataStore.shared.save(lotteries: lotteries)

    }
    
    
}


