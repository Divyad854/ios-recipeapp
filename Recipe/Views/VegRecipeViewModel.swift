import Foundation

@MainActor
class VegRecipeViewModel: ObservableObject {
    @Published var meals: [MealDetail] = []
    @Published var isLoading = false

    func loadVegMeals() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let shortMeals = try await APIService.shared.fetchVegMeals()
            print("Fetched \(shortMeals.count) veg meals") // Debug

            var tempMeals: [MealDetail] = []

            await withTaskGroup(of: MealDetail?.self) { group in
                for meal in shortMeals {
                    group.addTask {
                        try? await APIService.shared.lookup(meal.idMeal)
                    }
                }

                for await detail in group {
                    if let detail = detail {
                        tempMeals.append(detail)
                    }
                }
            }

            meals = tempMeals.sorted { $0.strMeal < $1.strMeal } // optional: sort alphabetically
            print("Loaded \(meals.count) full veg meals") // Debug
        } catch {
            print("Error loading veg meals:", error)
        }
    }
}
