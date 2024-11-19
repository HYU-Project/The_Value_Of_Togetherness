import SwiftUI

struct Me{
    var id = 202020
    var name = "김무명"
    var univCamp = "한양대학교 서울캠"
    var department = "컴퓨터소프트웨어학과"
    var profileImage = Image("SCPC_2024_Poster")
    var temperature = 40.5
    var myPost: Set<Int> = [1]
    var starPost: Set<Int> = [1]
    var participatePost: Set<Int> = [1]
}
struct Post1{
    var id = 1
    var subject = "주제"
    var price = 80050
    var leader = 202020
    var completed = false
    var image = Image("SCPC_2024_Poster")
}
var me = Me()
var post = Post1()
struct ContentView: View {
    @State var selection: Int
    var body: some View {
        NavigationStack{
            TabView(selection: $selection){
                CommunityMain()
                    .tabItem {
                        Label("공구", systemImage: "book")
                    }.tag(0)
                CommunityMain()
                    .tabItem {
                        Label("나눔", systemImage: "book")
                    }.tag(1)
                ChatListView()
                    .tabItem {
                        Label("채팅", systemImage: "book")
                    }.tag(2)
                MyHome()
                    .tabItem {
                        Label("마이홈", systemImage: "house")
                    }.tag(3)
            }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView(selection: 0)
}