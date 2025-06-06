//
//  badMoodView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/21.
//

import SwiftUI
import CodableAppStorage

struct badMoodView: View {
    @CodableAppStorage("fishlist") private var fishList: [mood]=[]
    @State private var selectedIndex = 0
    @State private var newMood = ""
    @State private var selectedPicture: String = "fish1"
    @State private var showMood = false
    @State private var selectedFish : mood?
    @State private var showAq = false
    @State private var today = Date()
    @State private var showAlert = false
    let fishPicture = ["fish1", "fish2", "fish3", "fish4", "fish5","fish6","fish7","fish8","fish9","fish10","fish11","fish12","fish13","fish14","fish15","fish16"]
    let alert: String = "要讓你的壞心情被烹煮嗎？"
    var body: some View {
        NavigationStack{
            ZStack{
                Image("7")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 40){
                    TextField("輸入你的壞心情", text: $newMood)
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 20))
                        .frame(width: 300, height: 40)
                    Picker("選一條魚",selection: $selectedPicture){
                        ForEach(fishPicture, id: \.self){name in
                            Image(name)
                                .resizable()
                                .scaledToFit()
                            
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Button("養一條心情魚"){
                        // guard !newMood.isEmpty else{return}
                        let Fish = mood( moodText: newMood, imageName:selectedPicture,date: today )
                        showAlert=true
                        showAq=true
                        
                        fishList.append(Fish)
                        
                        
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color(red: 185/255, green: 218/255, blue: 240/255))
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(1), radius: 8,x:0,y:6)
                }
                
                .alert(alert, isPresented: $showAlert){
                    Button("好的"){
                        
                    }
                }
                .navigationDestination(isPresented: $showAq){ badmoodAnswerView()}
                
            }
            
        }
    }
}
#Preview {
    badMoodView()
}
