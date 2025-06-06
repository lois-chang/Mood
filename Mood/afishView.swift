//
//  afishView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/20.
//

import SwiftUI

struct afishView: View {
  let fish:mood
    @State private var x = Float.random(in: -10...10)
    //@State private var y = Float.random(in: -10...10)
    var body: some View {
        Image(fish.imageName)
            .resizable()
            .scaledToFit()
           // .offset(x:CGFloat(x),y: CGFloat(y))
            
    }
}

//#Preview {
    //afishView()
//}
