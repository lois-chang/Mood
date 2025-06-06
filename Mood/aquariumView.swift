import SwiftUI
import CodableAppStorage

struct aquariumView: View {
    @CodableAppStorage("fishlist") private var fishList: [mood] = []
    @State private var showMood = false
    @State private var selectedFish: mood? = nil
    @State private var reloadTrigger = false
    
    var body: some View {
        
        List {
            ForEach(fishList) { fish in
                Button {
                    selectedFish = fish
                    showMood = true
                } label: {
                    Image(fish.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                }
            }
            .onDelete(perform: deleteItems)
            .listRowBackground(Color.clear)
            
        }
        
        .id(reloadTrigger)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline:.now()+0.5 ){
                reloadTrigger.toggle()
            }
        }
        
        .scrollContentBackground(.hidden)
        .background {
            Image("1")
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showMood) {
            if let selectedFish {
                answerView(fish: selectedFish)
            }
        }
    }
        
        
        private func deleteItems(at offsets: IndexSet) {
            fishList.remove(atOffsets: offsets)
        }
    }

#Preview {
    aquariumView()
}
