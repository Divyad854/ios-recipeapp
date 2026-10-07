//    import SwiftUI
//
//    struct HomeView: View {
//        var body: some View {
//            VStack(spacing: 25) {
//
//                Text("Welcome to Recipe App")
//                    .font(.largeTitle)
//                    .bold()
//
//                Image(systemName: "fork.knife.circle")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 140)
//                    .foregroundColor(.orange)
//
//                Text("Find recipes based on vegetables.\nBreakfast • Lunch • Dinner")
//                    .font(.headline)
//                    .multilineTextAlignment(.center)
//
//                NavigationLink("Explore Recipes") {
//                    RecipeMainView()
//                }
//                .padding()
//                .background(Color.orange.opacity(0.2))
//                .cornerRadius(12)
//            }
//            .padding()
//            .navigationTitle("Home")
//        }import SwiftUI
import SwiftUI

struct HomeView: View {
    @AppStorage("loggedInUsername") var username: String = ""
    @State private var navigateToRecipes = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {

                if !username.isEmpty {
                    Text("Welcome, \(username)!")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                } else {
                    Text("Welcome to Recipe App")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                }

                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                    .foregroundColor(.orange)

                Text("Find recipes based on vegetables.\nBreakfast • Lunch • Dinner")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                 NavigationLink(destination: RecipeMainView(), isActive: $navigateToRecipes) {
                EmptyView()
            }

                // Explore button always navigates
                Button("Explore Recipes") {
                    navigateToRecipes = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
