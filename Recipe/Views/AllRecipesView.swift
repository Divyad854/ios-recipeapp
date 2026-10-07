//
//  AllRecipesView.swift
//  Recipe
//
//  Created by BMIIT on 24/11/25.
//
import SwiftUI

struct AllRecipesView: View {
    @StateObject private var vm = AllRecipesViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading Recipes...")
                        .font(.headline)
                } else if vm.allMeals.isEmpty {
                    Text("No Recipes Found")
                        .foregroundColor(.gray)
                } else {
                    List(vm.allMeals) { meal in
                        HStack {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { img in
                                img.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 70, height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            Text(meal.strMeal)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("All Recipes")
            .task {
                await vm.loadAllMeals()
            }
        }
    }
}
