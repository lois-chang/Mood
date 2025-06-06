//
//  badmoodsheetView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/22.
//

import SwiftUI
import CodableAppStorage
import AVFoundation
struct badmoodsheetView: View {
    @Environment(\.dismiss) var dismiss
    @CodableAppStorage("fishlist") private var fishList: [mood] = []
    @State private var anmationShow = false
    let select:[String]
    let player = AVPlayer()
    var body: some View {
       
        if let food = select.first{
            if select == ["food5"]{
                VStack{
                    Image(food)
                        .resizable()
                        .scaledToFit()
                    Text("很抱歉，你的壞心情臭酸了，我把它拿去丟掉了")
                }
            } else if select == ["food6"]{
                    VStack{
                        Image(food)
                            .resizable()
                            .scaledToFit()
                        Text("很抱歉，你的壞心情生鏽了")
                    }
                }else {
                VStack{
                    Image(food)
                        .resizable()
                        .scaledToFit()
                    Text("恭喜你，你的壞心情已經變成食物了，等等會被吃掉")
                }
            }
        }
        Button("close",systemImage:"xmark.circle"){
            dismiss()
            anmationShow = true
            player.pause()
        }
        .offset(x:0,y:-550)
        
    }
}

//#Preview {
   // badmoodsheetView(select: ["food1"])
//}
