//
//  answerView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/20.
//

import SwiftUI

struct answerView: View {
    let fish :mood
    
    var body: some View {
        VStack{
            Image(fish.imageName)
                .resizable()
                .scaledToFit()
            Text(fish.moodText)
                .font(.largeTitle)
                .padding()
            Text("\(formattedDate)")
            
        }
        
    }
    var formattedDate: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: fish.date)
    }
}

//#Preview {
    //answerView(fish:mood(moodText: "very good", imageName:"fish1"))
//}
