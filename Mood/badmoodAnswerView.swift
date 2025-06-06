//
//  badmoodAnswerView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/21.
//

import SwiftUI
import CodableAppStorage
import AVFoundation
import DotLottie

struct badmoodAnswerView: View {
    @CodableAppStorage("fishlist") private var fishList: [mood] = []
    @State private var foodShow = false
    @State private var anmationShow = true
    @State private var select: String? = nil
    @State private var looper: AVPlayerLooper?
    let player = AVPlayer()
    let foodlist:[String] = ["food1","food2","food2","food3","food5","food6"]
   
    var body: some View {
        ZStack{
            
            
            Image("5")
                .onAppear{
                   
                    let url = Bundle.main.url(forResource: "boiling_covering", withExtension: "mp3")!
                    let playItem = AVPlayerItem(url: url)
                   
                    player.replaceCurrentItem(with: playItem)
                }
                //.resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 30){
                if anmationShow{
                    VStack{
                        DotLottieAnimation(fileName: "Animation - 1747835726465", config: AnimationConfig(autoplay:true, loop: true))
                            .view()
                            .frame(width: 400, height: 400)
                        HStack{
                            
                            DotLottieAnimation(fileName: "Animation - 1748328528437", config: AnimationConfig(autoplay:true, loop: true))
                                .view()
                                .frame(width: 200, height: 100)
                            DotLottieAnimation(fileName: "Animation - 1748328528437", config: AnimationConfig(autoplay:true, loop: true))
                                .view()
                                .frame(width: 200, height: 100)
                            
                        }}}
                    
                    Button("烹調我的壞心情"){
                        anmationShow = false
                        select = foodlist.randomElement()
                        foodShow = true
                        player.play()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 185/255, green: 218/255, blue: 240/255))
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(1), radius: 8,x:0,y:6)
                    .sheet(isPresented: $foodShow, onDismiss: {
                        anmationShow = true
                        
                    }){ if let food = select{badmoodsheetView(select: [food])}}
                
            }}
        
    }
    
}

#Preview {
    badmoodAnswerView()
}
