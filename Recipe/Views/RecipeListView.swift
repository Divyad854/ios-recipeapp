import SwiftUI

struct RecipeListView: View {

    let vegetable: String
    @StateObject private var vm = RecipeViewModel()

    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView("Loading Recipes...")
            }
            else if let error = vm.errorMessage {
                Text(error).foregroundColor(.red)
            }
            else {
                List(vm.recipes) { meal in
                    NavigationLink {
                        RecipeDetailView(recipe: meal)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { img in
                                img.resizable()
                            } placeholder: {
                                Color.gray.opacity(0.2)
                            }
                            .frame(width: 70, height: 60)
                            .cornerRadius(8)

                            Text(meal.strMeal)
                                .font(.headline)
                        }
                    }
                }
            }
        }
        .navigationTitle("\(vegetable) Recipes")
        .task {
            await vm.fetchRecipes(ingredient: vegetable.lowercased())
        }
    }
}
