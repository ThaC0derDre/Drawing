//
//  ImgAsBorder.swift
//  Drawing
//
//  Created by Andres Gutierrez on 4/7/22.
//

import SwiftUI

struct ImgAsBorder: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 350,height: 350)
//            .border(ImagePaint(image: Image("example"),scale: 0.2), width: 30)
        
        // using with rect
            .border(ImagePaint(image: Image("example"),sourceRect: CGRect(x: 0, y: 2.5, width: 1, height: 0.5) ,scale: 0.2), width: 30)
        
        // as a capsule instead of TextView
        Capsule()
            .strokeBorder(ImagePaint(image: Image("example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ImgAsBorder_Previews: PreviewProvider {
    static var previews: some View {
        ImgAsBorder()
    }
}
