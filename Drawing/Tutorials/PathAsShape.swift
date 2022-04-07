//
//  PathAsShape.swift
//  Drawing
//
//  Created by Andres Gutierrez on 4/6/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct Arc: Shape {
    let startPoint: Angle
    let endPoint: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // need the 3 'lets' to get desired effect
        let rotationAdjustment  = Angle.degrees(90)
        let modifiedStart       = startPoint - rotationAdjustment
        let modifiedEnd         = endPoint - rotationAdjustment
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.minY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct PathAsShape_Previews: PreviewProvider {
    static var previews: some View {
        Arc(startPoint: .degrees(0), endPoint: .degrees(110), clockwise: true)
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 200)
            
            
    }
}
