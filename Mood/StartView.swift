//
//  StartView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/21.
//

import SwiftUI
import DotLottie
import AVFoundation

struct StartView: View {
    @State private var badMood = false
    @State private var goodMood = false
    @State private var right = false
    @State private var isMute = false
    @State private var looper: AVPlayerLooper?
    
    @AppStorage("name") private var name: String = ""
    let player = AVQueuePlayer()

    var body: some View {
        NavigationStack{
            
            ZStack{
                Image("3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Image(systemName: isMute ? "speaker.slash.fill" :"speaker.fill")
                    .onAppear {
                           if player.currentItem == nil {
                               let url = Bundle.main.url(forResource: "ScreenRecording_06-05-2025 15-24-23_1 - Converted with FlexClip", withExtension: "mp3")!
                               let playItem = AVPlayerItem(url: url)
                               self.looper = AVPlayerLooper(player: player, templateItem: playItem)
                               player.play()
                           }
                       }
//                    .onAppear{
//                        let url = Bundle.main.url(forResource: "ScreenRecording_06-05-2025 15-24-23_1 - Converted with FlexClip", withExtension: "mp3")!
//                        let playItem = AVPlayerItem(url: url)
//                        self.looper = AVPlayerLooper(player:  player, templateItem: playItem)
//                        player.play()
//                    }
                    .onTapGesture {
                        isMute.toggle()
                        if isMute{
                            player.pause()
                        }else{
                            player.play()
                        }
                    }
                    .offset(x:120,y:-360)
                    .font(.system(size: 40))
                    
                ZStack(alignment: .topLeading){
                    NavigationLink(destination: menuView()){
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .padding()
                        
                        
                    }
                    
                    VStack{
                        Spacer()
                        HStack(spacing: 60){
                            Button("心情很美麗"){
                                
                                goodMood=true
                                
                            }
                            .navigationDestination(isPresented: $goodMood){ mainView()
                            }
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color(red: 185/255, green: 218/255, blue: 240/255))
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(1), radius: 8,x:0,y:6)
                            
                            Button("心情不美麗"){
                                badMood = true
                            }
                            .navigationDestination(isPresented: $badMood){ badMoodView()
                            }
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color(red: 185/255, green: 218/255, blue: 240/255))
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(1), radius: 8,x:0,y:6)
                            
                        }
                        
                        Spacer()
                    }
                    
                    
                }
                VStack{
                    
                        
                        Text("你好，\(name.isEmpty ? "朋友" : name)！今天心情好嗎？")
                            .font(.title)
                            .bold()
                            .offset(x: 0, y: 200)
                        
                    
                    
                    DotLottieAnimation(fileName: "Animation - 1748256494959", config: AnimationConfig(autoplay:true, loop: true)).view().allowsHitTesting(false)
                    DotLottieAnimation(fileName: "Animation - 1748261568044", config: AnimationConfig(autoplay:true, loop: true)).view().allowsHitTesting(false)}}
            }
        
        }
        
        
    }

        
        //                    DotLottieAnimation(fileName: "Animation - 1748256494959", config: AnimationConfig(autoplay:true, loop: true)).view().allowsHitTesting(false)
        //                    DotLottieAnimation(fileName: "Animation - 1748261568044", config: AnimationConfig(autoplay:true, loop: true)).view().allowsHitTesting(false)}
        
  

#Preview {
    StartView()
}
