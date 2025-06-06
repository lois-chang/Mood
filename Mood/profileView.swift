//
//  profileView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/19.
//

import SwiftUI

struct profileView: View {
    @AppStorage("name") private var name = ""
    //@State private var select:[String]
    @State private var picture: String = ""
    @State private var birthday = Date()
    @State private var showAlert = false
    @State private var alertTitle = "儲存成功！！"
    @AppStorage("picture") private var savePictures = ""
    @AppStorage("Birthday") private var Birthday :Double = 0.0
    let profileList = ["自行想像","一隻袋鼠","一匹馬","一隻雞","石頭魚？","一顆虎頭","一顆牛頭","水獺？","一隻企鵝","一隻鹿","一條狗"]
    var body: some View {
        ScrollView{
           
                
            VStack(spacing:20){
                    if !savePictures .isEmpty{
                        Image(savePictures)
                            .resizable()
                            .scaledToFit()
                        
                    }
                    
                    Picker("選一個頭像吧",selection: $picture){
                        ForEach(profileList, id: \.self){name in
                            Text(name)
                        }
                    }
                    
                    
                    TextField("Name",text: $name)
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 20))
                        .frame(width: 300, height: 40)
                    HStack(spacing:100){
                        Text("你的生日")
                            .font(.headline)
                        DatePicker("",selection: $birthday,displayedComponents: .date)
                            .labelsHidden()
                    }
                    Button("儲存"){
                        savePictures = picture
                        Birthday = birthday.timeIntervalSince1970
                        showAlert = true
                    }
                    .alert(alertTitle, isPresented: $showAlert){
                        Button("好的"){
                            
                        }
                    }
                    .frame(width: 100, height: 10)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color(red: 185/255, green: 218/255, blue: 240/255))
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(1), radius: 8,x:0,y:6)
                }
                .onAppear{if Birthday > 0{
                    birthday = Date(timeIntervalSince1970: Birthday)
                }}
            }
//        .background(Color(red: 210/255, green: 243/255, blue: 247/255))
//            .ignoresSafeArea()
        }
      
    }

#Preview {
    profileView()
}
