//
//  PetalTut.swift
//  Drawing
//
//  Created by Andres Gutierrez on 4/7/22.
//

import SwiftUI

struct Flower: Shape {
    // petal away from center
    var petalOffset: Double = -20
    
    var petalWidth: Double  = 100
    
    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()
        
        // Count up from 0, to double.pi, which is == 360, moving in increments of 1/8, for total of 16 petals
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            
            // rotate the petal by our current number in the loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for petal using our properties and a fixed Y and Height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply transformation to petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add to main path
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}


struct PetalTut: View {
    @State private var petalOffset:Double   = -20
    @State private var petalWidth:Double    = 100
    
    var body: some View {
        VStack{
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.red, lineWidth: 1)
            // use even-out rule to fill whats not overlapping
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct PetalTut_Previews: PreviewProvider {
    static var previews: some View {
        PetalTut()
    }
}
