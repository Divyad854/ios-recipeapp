import Foundation

@MainActor
class NonVegRecipeViewModel: ObservableObject {
    @Published var meals: [MealDetail] = []
    @Published var isLoading = false

    private let nonVegCategories = ["Chicken", "Beef", "Pork", "Lamb", "Seafood"]

    func loadNonVegMeals() async {
        isLoading = true
        defer { isLoading = false }

        var tempMeals: [MealDetail] = []

        for category in nonVegCategories {
            do {
                let shortMeals = try await APIService.shared.fetchByCategory(category)
                
                // Fetch full details in parallel
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
            } catch {
                print("Error fetching category \(category):", error)
            }
        }

        meals = tempMeals.sorted { $0.strMeal < $1.strMeal }
        print("Loaded \(meals.count) Non-Veg meals")
    }
}
