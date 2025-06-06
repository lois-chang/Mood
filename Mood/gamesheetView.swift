//
//  gamesheetView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/26.
//

import SwiftUI

struct gamesheetView: View {
    @State private var flipped = false
    let select: [String]
    var body: some View {
        ZStack{
            Color(red: 155/255, green: 207/255, blue: 235/255)
                .ignoresSafeArea()
            Image(flipped ? "card" : "cardback")
                .resizable()
                .scaledToFit()
                .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z:0))
                
            if flipped {
                if let word = select.first{
                    Text(word)
                        .font(.custom("NaniFont-ExtraLight", size: 30))
                        .offset(x: 0, y: 200)
                        //.foregroundColor(.white)
                        //.rotation3DEffect(.degrees(180), axis: (x: 0,y:1,z:0))
                }
            }
        }
        

        .onTapGesture{withAnimation{
            flipped.toggle()
        }}
    }
}


