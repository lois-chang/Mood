//
//  stressview.swift
//  Mood
//
//  Created by Mac14 on 2025/6/4.
//

import SwiftUI

struct stressview: View {
    let images =    ["shark1","shark2","shark3","shark4","shark5","shark6","shark7","shark8","shark9","shark10"]
    @State private var image = 0
    @State private var pressCount = 0
    @State private var progress: Double = 0
    @State private var isPressed = false
    @State private var isScaling = false
    let maxPress = 100
    
    var body: some View {
        ZStack{
            Image("bubble")
            VStack(spacing: 30){
                Text("釋放壓力吧！")
                    .font(.title)
                    .bold()
                    .padding()
                Image(images[image])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 300)
                    .scaleEffect(isScaling ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.19), value: isScaling)
                    .onTapGesture {
                        isScaling.toggle()
                        pressCount += 1
                        progress = Double(pressCount) / Double(maxPress)
                        
                        if pressCount >= maxPress{
                            pressCount = 0
                            progress = 0.0
                            image = (image + 1) % images.count
                        }
                    }
                
                Text("打了：\(pressCount)")
                if pressCount == 99 {
                    Text("變身")
                        .font(.title)
                }
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(width: 300, height: 20)
                        .opacity(0.3)
                        .foregroundStyle(.gray)
                    
                    Rectangle()
                        .frame(width: progress*300, height: 20)
                        .foregroundStyle(.green)
                        .animation(.linear(duration: 2),value: progress)
                }
                //            ProgressView(value: progress)
                //                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                //                .frame(width: 200)
                //                .animation(.easeOut,value: progress)
            }
        }
    }
}

#Preview {
    stressview()
}
