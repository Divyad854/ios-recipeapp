import Foundation

@MainActor
class RecipeViewModel: ObservableObject {

    @Published var recipes: [MealShort] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchRecipes(ingredient: String) async {
        isLoading = true

        do {
            recipes = try await APIService.shared.fetchByIngredient(ingredient)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
