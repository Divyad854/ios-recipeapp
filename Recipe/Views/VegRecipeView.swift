import SwiftUI

struct VegRecipeView: View {
    @StateObject private var vm = VegRecipeViewModel()
    @State private var searchText = ""

    var filteredMeals: [MealDetail] {
        if searchText.isEmpty {
            return vm.meals
        } else {
            return vm.meals.filter { $0.strMeal.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading Veg Recipes...")
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if filteredMeals.isEmpty {
                    Text("No Veg Recipes Found")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        VStack {
                            // Attractive Search Bar
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                TextField("Search recipes...", text: $searchText)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            .padding(12)
                            .background(Color(.systemGray5))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)
                            .padding(.top, 10)

                            LazyVStack(spacing: 40) {
                                ForEach(filteredMeals) { meal in
                                    VStack(alignment: .leading, spacing: 10) {
                                        // Recipe Image with overlay title
                                        ZStack(alignment: .bottomLeading) {
                                            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { img in
                                                img.resizable()
                                                     .scaledToFill()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(height: 200)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                            .cornerRadius(15)
                                            
                                            Text(meal.strMeal)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(8)
                                                .background(Color.black.opacity(0.5))
                                                .cornerRadius(10)
                                                .padding([.leading, .bottom], 10)
                                        }

                                        // Full Recipe Instructions
                                        if let instructions = meal.strInstructions {
                                            Text(instructions)
                                                .font(.body)
                                                .foregroundColor(.primary)
                                                .lineSpacing(4)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding(.horizontal, 5)
                                        }
                                    }
                                    .background(Color(.systemGray6))
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
            }
            .navigationTitle("Veg Recipes")
            .task {
                await vm.loadVegMeals()
            }
        }
    }
}
