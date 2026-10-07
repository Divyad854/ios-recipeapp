import SwiftUI

struct RecipeDetailView: View {

    let recipe: MealShort
    @State private var detail: MealDetail?
    @State private var isFav = false

    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    @AppStorage("loggedInPassword") var loggedInPassword: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                AsyncImage(url: URL(string: recipe.strMealThumb)) { img in
                    img.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 240)
                .clipped()

                HStack {
                    Text(detail?.strMeal ?? recipe.strMeal)
                        .font(.title)
                        .bold()

                    Spacer()

                    Button {
                        toggleFavourite()
                    } label: {
                        Image(systemName: isFav ? "heart.fill" : "heart")
                            .font(.system(size: 28))
                            .foregroundColor(.red)
                    }
                }

                Text(detail?.strInstructions ?? "Loading...")
                    .padding(.top)
            }
            .padding()
        }
        .task {
            detail = try? await APIService.shared.lookup(recipe.idMeal)
            loadFavouriteStatus()
        }
        .navigationTitle("Details")
    }

    // MARK: - Load Favourite
    func loadFavouriteStatus() {
        guard let user = UserManager.shared.loginUser(
            email: loggedInEmail,
            password: loggedInPassword
        ) else { return }

        isFav = UserManager.shared.isFavourite(user: user, id: recipe.idMeal)
    }

    // MARK: - Toggle
    func toggleFavourite() {
        guard let user = UserManager.shared.loginUser(
            email: loggedInEmail,
            password: loggedInPassword
        ) else { return }

        if isFav {
            UserManager.shared.removeFavourite(for: user, id: recipe.idMeal)
        } else {
            UserManager.shared.addFavourite(
                for: user,
                id: recipe.idMeal,
                name: recipe.strMeal,
                image: recipe.strMealThumb
            )
        }

        isFav.toggle()
    }
}
