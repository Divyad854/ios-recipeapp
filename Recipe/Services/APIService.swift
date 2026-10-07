//import Foundation
//
//class APIService {
//    static let shared = APIService()
//    private init() {}
//
//    private let base = "https://www.themealdb.com/api/json/v1/1/"
//
//    func fetchByIngredient(_ ingredient: String) async throws -> [MealShort] {
//        let url = URL(string: "\(base)filter.php?i=\(ingredient)")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return try JSONDecoder().decode(MealsResponseShort.self, from: data).meals ?? []
//    }
//
//    func lookup(_ id: String) async throws -> MealDetail? {
//        let url = URL(string: "\(base)lookup.php?i=\(id)")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return try JSONDecoder().decode(MealsResponseDetail.self, from: data).meals?.first
//    }
//}
import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    private let base = "https://www.themealdb.com/api/json/v1/1/"

    // MARK: - Filter by ingredient
    func fetchByIngredient(_ ingredient: String) async throws -> [MealShort] {
        let url = URL(string: "\(base)filter.php?i=\(ingredient)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(MealsResponseShort.self, from: data).meals ?? []
    }

    func lookup(_ id: String) async throws -> MealDetail? {
        let url = URL(string: "\(base)lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(MealsResponseDetail.self, from: data).meals?.first
    }
    // MARK: - Filter by category (needed for veg/non-veg)
    func fetchByCategory(_ category: String) async throws -> [MealShort] {
        let url = URL(string: "\(base)filter.php?c=\(category)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(MealsResponseShort.self, from: data).meals ?? []
    }

    // MARK: - VEG / NON-VEG SUPPORT

    private let vegCategories = ["Vegetarian", "Vegan"]
    private let nonVegCategories = ["Chicken", "Beef", "Pork", "Lamb", "Seafood"]

    // Fetch VEG meals
    func fetchVegMeals() async throws -> [MealShort] {
        var final: [MealShort] = []
        for cat in vegCategories {
            let list = try await fetchByCategory(cat)
            final.append(contentsOf: list)
        }
        return final
    }

    // Fetch NON-VEG meals
    func fetchNonVegMeals() async throws -> [MealShort] {
        var final: [MealShort] = []
        for cat in nonVegCategories {
            let list = try await fetchByCategory(cat)
            final.append(contentsOf: list)
        }
        return final
    }
}
