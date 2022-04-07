//
//  PathTut.swift
//  Drawing
//
//  Created by Andres Gutierrez on 4/6/22.
//

import SwiftUI
/*
 issue with path, are the fixed CGPoints
 */

struct PathTut: View {
    var body: some View {
        Path{ path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//           2) To complete line at top with stroke
            path.closeSubpath()
        }
//        To quickly make it blue
        //   1) .fill(.blue)
        
//         To add thick outline
        //   2) .stroke(.blue, lineWidth: 12)
        
//        Alternatively, use StrokeStyle
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .miter))
    }
}


struct PathTut_Previews: PreviewProvider {
    static var previews: some View {
        PathTut()
    }
}
