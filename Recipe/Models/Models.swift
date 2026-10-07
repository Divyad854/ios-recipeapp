import Foundation

struct MealShort: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String

    var id: String { idMeal }
}

struct MealDetail: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String?
    let strMealThumb: String?

    var id: String { idMeal }
}

struct MealsResponseShort: Codable {
    let meals: [MealShort]?
}

struct MealsResponseDetail: Codable {
    let meals: [MealDetail]?
}
