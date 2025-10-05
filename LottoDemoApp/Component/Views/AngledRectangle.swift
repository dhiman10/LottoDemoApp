//
//  AngledRectangle.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//


import SwiftUI

struct AngledRectangle: Shape {
    var angleOffset: CGFloat = 20
    var cornerRadius: CGFloat = 8
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: angleOffset + cornerRadius, y: 0))
        
        path.addArc(
            center: CGPoint(x: angleOffset + cornerRadius, y: cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: -90),
            endAngle: Angle(degrees: -180),
            clockwise: true
        )
        
        // Left edge
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        // Bottom edge
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // Right edge
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        // Top edge to angled start
        path.addLine(to: CGPoint(x: angleOffset + cornerRadius, y: 0))
        
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    AngledRectangle(angleOffset: 30, cornerRadius: 10)
        .fill(Color.yellow)
        .frame(width: 200, height: 100)
}
