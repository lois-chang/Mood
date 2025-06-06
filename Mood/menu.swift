//
//  menu.swift
//  Mood
//
//  Created by Mac14 on 2025/5/19.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination:profileView()){
                    HStack(spacing:40){
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("個人檔案")
                            .font(.title)
                    }
                }
                NavigationLink(destination: gameView()){
                    HStack(spacing:40){
                        Image("game")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("扭蛋遊戲")
                            .font(.title)
                    }
                }
                NavigationLink(destination:stressview() ){
                    HStack(spacing: 40){
                        Image("toy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("舒壓遊戲")
                            .font(.title)
                    }
                }
                
            }
            }
        }
    }


#Preview {
    menuView()
}
