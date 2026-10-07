//
//  AllRecipesViewModel.swift
//  Recipe
//
//  Created by BMIIT on 24/11/25.
//
import Foundation

@MainActor
class AllRecipesViewModel: ObservableObject {
    @Published var allMeals: [MealShort] = []
    @Published var isLoading = false

    private let categories = ["Vegetarian", "Vegan", "Chicken", "Beef", "Pork", "Lamb", "Seafood"]

    func loadAllMeals() async {
        isLoading = true
        var tempMeals: [MealShort] = []

        await withTaskGroup(of: [MealShort]?.self) { group in
            for category in categories {
                group.addTask {
                    do {
                        return try await APIService.shared.fetchByCategory(category)
                    } catch {
                        print("Error fetching \(category):", error)
                        return nil
                    }
                }
            }

            for await meals in group {
                if let meals = meals {
                    tempMeals.append(contentsOf: meals)
                }
            }
        }

        // Sort alphabetically by meal name
        allMeals = tempMeals.sorted { $0.strMeal < $1.strMeal }
        isLoading = false
    }
}
