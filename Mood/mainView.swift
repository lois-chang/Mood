import SwiftUI
import CodableAppStorage
import DotLottie
struct mainView: View {
    @CodableAppStorage("fishlist") private var fishList: [mood] = []
    @State private var newMood = ""
    @State private var selectedPicture: String = "fish1"
    @State private var showAq = false
    @State private var showAlert = false
    @State private var today = Date()
    @State private var reloadTrigger = false
    @AppStorage("Today") private var Today :Double = 0.0
    let fishPicture = ["fish1", "fish2", "fish3", "fish4", "fish5","fish6","fish7","fish8","fish9","fish10","fish11","fish12","fish13","fish14","fish15","fish16"]
    let alert: String = "魚需要一點時間消化你的心情喔！請稍等"
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("6")
                    .ignoresSafeArea()
                
                Image("i1")
                    .offset(x:30,y:-250)
                
                    
                
                VStack(spacing:40) {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 20)
//                            .frame(width:300,height: 100)
//                            .foregroundColor(Color(red: 185/255, green: 218/255, blue: 240/255))
////                        Text("紀錄你的好心情吧!")
////                            .font(.title)
////                            .foregroundColor(Color.gray)
//                    }
                    TextField("輸入你的好心情", text: $newMood)
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 20))
                        .frame(width: 300, height: 20)
                    HStack(spacing:100){
                        Text("今天日期")
                            .font(.headline)
                        DatePicker("",selection: $today,displayedComponents: .date)
                            .labelsHidden()
                    }
                    Picker("選一條魚", selection: $selectedPicture) {
                        ForEach(fishPicture, id: \.self) { name in
                            Image(name)
                                .resizable()
                                .scaledToFit()
                            
                        }
                        
                    }
                    
                    .pickerStyle(.wheel)
                    
                    Button("養一條心情魚") {
                        Today = today.timeIntervalSince1970
                        let Fish = mood(moodText: newMood, imageName: selectedPicture,date: today)
                        fishList.append(Fish)
                       
                        showAlert = true

                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            showAq = true
                                                       
                            
                        }
                        
                        
                    }
                    .onAppear{if Today > 0{
                        today = Date(timeIntervalSince1970: Today)
                    }}
                    .alert(alert, isPresented: $showAlert){
                        Button("好的"){
                            
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color(red: 185/255, green: 218/255, blue: 240/255))
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(1), radius: 8,x:0,y:6)
                    
                    .navigationDestination(isPresented: $showAq) {
                        aquariumView()
                    }
                }
               
            }
            
        }
        .id(reloadTrigger)
        .onChange(of: fishList) {
            reloadTrigger.toggle()
        }
                .onAppear {
                    reloadTrigger.toggle()
                }
    }
    
}
#Preview {
    mainView()
}

