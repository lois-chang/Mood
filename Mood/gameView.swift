//
//  gameView.swift
//  Mood
//
//  Created by Mac14 on 2025/5/26.
//

import SwiftUI
import AVFoundation

struct gameView: View {
    @State private var isShaking = false
    @State private var wordShow = false
    @State private var select:String? = nil
    let player = AVPlayer()
    let wordList : [String]=[
        "你可以的！",
        "別放棄，加油！",
        "相信自己。",
        "你值得被愛。",
        "今天也是好日子。",
        "你已經做得很好了。",
        "一步一步來。",
        "你很勇敢。",
        "繼續努力！",
        "你不孤單。",
        "做你自己就很棒。",
        "你的努力值得肯定。",
        "一切都會好起來的。",
        "你是獨一無二的。",
        "休息一下也沒關係。",
        "你的存在很重要。",
        "你讓這個世界更美好。",
        "你是有價值的。",
        "你會越來越好的。",
        "慢慢來，沒關係。",
        "你有權利感到情緒。",
        "現在的你也很棒。",
        "你擁有選擇的力量。",
        "你的感受很真實。",
        "你值得被尊重。",
        "你已經走了好遠的路。",
        "你有無限可能。",
        "別忘了為自己微笑。",
        "你很努力了，真的。",
        "你是可以依靠的人。",
        "人生沒有白走的路。",
        "你正在成長。",
        "放慢腳步也不錯。",
        "給自己一點耐心。",
        "每天都是新開始。",
        "謝謝你撐到現在。",
        "你是個溫暖的人。",
        "你做得比你想得還好。",
        "相信時間會給你答案。",
        "你的故事很特別。",
        "你值得擁有幸福。",
        "走得慢沒關係，別停下來。",
        "你正在變得更好。",
        "別忘了善待自己。",
        "你有能力改變一切。",
        "你比你想的更堅強。",
        "你值得擁有平靜。",
        "你值得被理解。",
        "你做得很好，不用太苛責。",
        "給自己一個擁抱。",
        "你的付出會有回報。",
        "你值得被看見。",
        "未來會感謝現在的你。",
        "你是自己的光。",
        "你可以慢慢來。",
        "別急，一切都在路上。",
        "你很重要。",
        "你可以說不。",
        "你正在走在對的路上。",
        "願你被溫柔以待。",
        "不要怕犯錯。",
        "學會放過自己。",
        "你可以重新開始。",
        "每一天都有希望。",
        "你就是奇蹟的證明。",
        "做你喜歡的自己。",
        "你值得擁有美好。",
        "你是一道風景。",
        "你已經很努力了。",
        "請相信，愛在路上。",
        "不比較，就是自由。",
        "你的價值不由他人定義。",
        "笑一笑，世界更美好。",
        "你正在創造不凡。",
        "你是一顆閃亮的星星。",
        "你給世界帶來光。",
        "做自己，就是最棒的你。",
        "願你心中有光，眼裡有笑。",
        "人生不必完美，但可以很美。",
        "你的存在本身就是意義。",
        "無論發生什麼，你都值得愛。",
        "每一步都值得驕傲。",
        "希望就在下一站。",
        "你比昨天更好了。",
        "你的感受很真實。",
        "你配得上所有美好。",
        "努力過就是贏家。",
        "生活會越來越好的。",
        "你有選擇幸福的能力。",
        "即使不完美，也值得被愛。",
        "人生沒有白走的路。",
        "你永遠不會一無所有。",
        "你擁有向陽的力量。",
        "溫柔一點，對自己也一樣。",
        "今天的你也很好。",
        "你不需要證明自己。",
        "你的笑容是最美的風景。",
        "堅持一下，就快到了。",
        "你是勇敢的靈魂。",
        "與其努力，不如放棄。",
        "再難，也別忘了愛自己。",
        "活著，就是一種勝利。",
        "你有愛的能力。",
        "你的人生值得被珍惜。"
    ]
    var body: some View {
       
            
        ZStack{
            Color(red: 155/255, green: 207/255, blue: 235/255)
                .ignoresSafeArea()
                .onAppear{
                    let url = Bundle.main.url(forResource: "magic2", withExtension: "mp3")!
                    let playerItem = AVPlayerItem(url: url)
                    player.replaceCurrentItem(with: playerItem)
                   
                }
            VStack{
                Image("game")
                    
                    .resizable()
                    .scaledToFit()
                    .offset(x:isShaking ? -10 : 0)
                    .animation(Animation.linear(duration: 0.1).repeatCount(5, autoreverses: true),value: isShaking)
                    .onTapGesture {
                        player.play()
                        isShaking = true
                        select = wordList.randomElement()
                        
                        Task{
                            try await Task.sleep(for: .seconds(0.5))
                            isShaking = false
                            wordShow = true
                        }
                        
                    }
                    .sheet(isPresented: $wordShow){
                        if let word = select{gamesheetView(select: [word])}
                    }
                
            }
           
            
        }
        }
    }


#Preview {
    gameView()
}
