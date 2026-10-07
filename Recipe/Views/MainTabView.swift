//import SwiftUI
//
//struct MainTabView: View {
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem { Label("Home", systemImage: "house") }
//
//            VegRecipeView()
//                .tabItem { Label("Veg", systemImage: "leaf") }
//            NonVegRecipeView()
//                            .tabItem {
//                                Label("Non-Veg", systemImage: "flame")
//                            }
//            RecipeMainView()
//                .tabItem { Label("Recipes", systemImage: "fork.knife") }
//
//            ContactNoView()
//                .tabItem { Label("Contact", systemImage: "envelope") }
//        }
//    }
//}
//
//
//import SwiftUI
//
//struct MainTabView: View {
//    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
//
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem { Label("Home", systemImage: "house") }
//
//            VegRecipeView()
//                .tabItem { Label("Veg", systemImage: "leaf") }
//
//            NonVegRecipeView()
//                .tabItem { Label("Non-Veg", systemImage: "flame") }
//
//            RecipeMainView()
//                .tabItem { Label("Recipes", systemImage: "fork.knife") }
//
//            VStack {
//                Button("Logout") {
//                    isLoggedIn = false
//                }
//                .padding()
//                .background(Color.red)
//                .foregroundColor(.white)
//                .cornerRadius(12)
//            }
//            .tabItem { Label("Profile", systemImage: "person.crop.circle") }
//        }
//    }
//}
//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            MainTabView()
//        }
//    }
//}
import SwiftUI

struct MainTabView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("loggedInUsername") var loggedInUsername: String = ""
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            VegRecipeView()
                .tabItem { Label("Veg", systemImage: "leaf") }
            
            NonVegRecipeView()
                .tabItem { Label("Non-Veg", systemImage: "flame") }
            
            ContactNoView()
                .tabItem { Label("Contact", systemImage: "phone") }
            
            ProfileView(isLoggedIn: $isLoggedIn, loggedInUsername: $loggedInUsername)
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainTabView()
        }
    }
}
