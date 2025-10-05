//
//  NumberBall.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.

import SwiftUI

struct NumberBall: View {
    let number: String
    var body: some View {
        Text(number)
            .font(.system(size: 14, weight: .semibold))
            .frame(width: 35, height: 35)
            .foregroundColor(.black)
            .background(Color.white)
            .clipShape(Circle())
    }
}

struct LotteryNumbersView: View {
    let numbers: [Int]
    let specialNumbers: [Int]
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(numbers, id: \.self) { num in
                NumberBall(number: "\(num)")
            }
            
            if !specialNumbers.isEmpty {
                HStack(spacing: 4) {
                    ForEach(specialNumbers, id: \.self) { num in
                        NumberBall(number: "\(num)")
                    }
                }
                .padding(4)
                .background(Color(white: 0.6))
                .clipShape(Capsule())
            }
        }
        .padding(.leading, 4)
        .background(Color(UIColor.systemFill))
        .cornerRadius(24)
    }
}

#Preview {
    
    VStack(alignment: .leading) {
        LotteryNumbersView(numbers: [1, 2, 3, 14, 25], specialNumbers: [42, 36])
        
        LotteryNumbersView(numbers: [1, 2, 3, 14, 25], specialNumbers: [36])
    }

}

