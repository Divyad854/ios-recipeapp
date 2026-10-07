    //import SwiftUI
    //
    //struct RecipeMainView: View {
    //
    //    @State private var selectedVegetable = ""
    //    @State private var selectedMealType = ""
    //
    //    let vegetables = ["Tomato","Potato","Onion","Carrot","Spinach",
    //                      "Broccoli","Cauliflower","Cabbage","Peas",
    //                      "Garlic","Ginger","Mushroom"]
    //
    //    let vegetableIcons: [String: String] = [
    //        "Tomato": "leaf.fill", "Potato": "circle.fill", "Onion": "drop.fill",
    //        "Carrot": "carrot.fill", "Spinach": "leaf", "Broccoli": "leaf.arrow.circlepath",
    //        "Cauliflower": "hexagon.fill", "Cabbage": "capsule.fill", "Peas": "circle.grid.2x2.fill",
    //        "Garlic": "drop.triangle.fill", "Ginger": "flame.fill", "Mushroom": "capsule.fill"
    //    ]
    //
    //    let mealTypes = ["Breakfast", "Lunch", "Dinner"]
    //    let mealIcons: [String: String] = [
    //        "Breakfast": "sunrise.fill",
    //        "Lunch": "sun.max.fill",
    //        "Dinner": "moon.stars.fill"
    //    ]
    //
    //    @State private var animatedIconIndex = 0
    //    let animatedIcons = ["fork.knife", "leaf", "flame", "sun.max", "moon.stars", "carrot.fill", "circle.fill"]
    //
    //    var body: some View {
    //        VStack(spacing: 30) {
    //
    //            // Title
    //            Text("Recipes")
    //                .font(.system(size: 36, weight: .bold))
    //                .foregroundColor(.orange)
    //                .padding(.top)
    //
    //            // Animated Icon
    //            Image(systemName: animatedIcons[animatedIconIndex])
    //                .resizable()
    //                .scaledToFit()
    //                .frame(width: 60, height: 60)
    //                .foregroundColor(.orange)
    //                .onAppear {
    //                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
    //                        withAnimation(.easeInOut(duration: 1)) {
    //                            animatedIconIndex = (animatedIconIndex + 1) % animatedIcons.count
    //                        }
    //                    }
    //                }
    //
    //            // Vegetable Selection
    //            VStack(alignment: .center, spacing: 15) {
    //                Text("Select Vegetable")
    //                    .font(.title2)
    //                    .foregroundColor(.secondary)
    //                    .frame(maxWidth: .infinity, alignment: .center)
    //
    //                ScrollView(.horizontal, showsIndicators: false) {
    //                    HStack(spacing: 20) {
    //                        ForEach(vegetables, id: \.self) { veg in
    //                            Button {
    //                                withAnimation(.spring()) {
    //                                    selectedVegetable = veg
    //                                }
    //                            } label: {
    //                                VStack(spacing: 8) {
    //                                    Image(systemName: vegetableIcons[veg] ?? "leaf.fill")
    //                                        .resizable()
    //                                        .scaledToFit()
    //                                        .frame(width: 45, height: 45)
    //                                        .foregroundColor(selectedVegetable == veg ? .white : .green)
    //                                    Text(veg)
    //                                        .font(.headline)
    //                                        .foregroundColor(selectedVegetable == veg ? .white : .primary)
    //                                }
    //                                .padding(14)
    //                                .background(selectedVegetable == veg ? Color.orange : Color(.systemGray6))
    //                                .cornerRadius(16)
    //                                .shadow(color: selectedVegetable == veg ? Color.orange.opacity(0.4) : Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
    //                            }
    //                        }
    //                    }
    //                    .frame(maxWidth: .infinity)
    //                    .padding(.horizontal)
    //                }
    //            }
    //
    //            // Meal Type Selection
    //            VStack(alignment: .center, spacing: 15) {
    //                Text("Select Meal Type")
    //                    .font(.title2)
    //                    .foregroundColor(.secondary)
    //                    .frame(maxWidth: .infinity, alignment: .center)
    //
    //                HStack(spacing: 20) {
    //                    ForEach(mealTypes, id: \.self) { meal in
    //                        Button {
    //                            withAnimation(.spring()) {
    //                                selectedMealType = meal
    //                            }
    //                        } label: {
    //                            VStack(spacing: 8) {
    //                                Image(systemName: mealIcons[meal] ?? "fork.knife")
    //                                    .resizable()
    //                                    .scaledToFit()
    //                                    .frame(width: 45, height: 45)
    //                                    .foregroundColor(selectedMealType == meal ? .white : .orange)
    //                                Text(meal)
    //                                    .font(.headline)
    //                                    .foregroundColor(selectedMealType == meal ? .white : .primary)
    //                            }
    //                            .padding(14)
    //                            .background(selectedMealType == meal ? Color.orange : Color(.systemGray6))
    //                            .cornerRadius(16)
    //                            .shadow(color: selectedMealType == meal ? Color.orange.opacity(0.4) : Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
    //                        }
    //                    }
    //                }
    //                .frame(maxWidth: .infinity)
    //                .padding(.horizontal)
    //            }
    //
    //            // Show Recipes Button
    //            NavigationLink {
    //                RecipeListView(vegetable: selectedVegetable)
    //            } label: {
    //                HStack {
    //                    Image(systemName: "book.fill")
    //                    Text("Show Recipes")
    //                        .bold()
    //                }
    //                .padding()
    //                .frame(maxWidth: .infinity)
    //                .background(selectedVegetable.isEmpty ? Color.gray : Color.orange)
    //                .foregroundColor(.white)
    //                .cornerRadius(16)
    //                .shadow(color: Color.orange.opacity(0.3), radius: 4, x: 0, y: 3)
    //            }
    //            .disabled(selectedVegetable.isEmpty)
    //            .padding(.horizontal)
    //
    //            Spacer()
    //        }
    //        .padding(.vertical)
    //        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    //    }
    //}
    //
    //struct RecipeMainView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        NavigationStack {
    //            RecipeMainView()
    //        }
    //    }
    //}
    import SwiftUI

    struct RecipeMainView: View {

        @State private var selectedVegetable = ""
        @State private var selectedMealType = ""

        let vegetables = ["Tomato","Potato","Onion","Carrot","Spinach",
                          "Broccoli","Cauliflower","Cabbage","Peas",
                          "Garlic","Ginger","Mushroom"]
        
        let vegetableIcons: [String: String] = [
            "Tomato": "leaf.fill", "Potato": "circle.fill", "Onion": "drop.fill",
            "Carrot": "carrot.fill", "Spinach": "leaf", "Broccoli": "leaf.arrow.circlepath",
            "Cauliflower": "hexagon.fill", "Cabbage": "capsule.fill", "Peas": "circle.grid.2x2.fill",
            "Garlic": "drop.triangle.fill", "Ginger": "flame.fill", "Mushroom": "capsule.fill"
        ]

        let mealTypes = ["Breakfast", "Lunch", "Dinner"]
        let mealIcons: [String: String] = [
            "Breakfast": "sunrise.fill",
            "Lunch": "sun.max.fill",
            "Dinner": "moon.stars.fill"
        ]

        @State private var animatedIconIndex = 0
        let animatedIcons = ["fork.knife", "leaf", "flame", "sun.max", "moon.stars", "carrot.fill", "circle.fill"]

        var body: some View {
            VStack(spacing: 30) {

                // Title + Favourite Button
                HStack {
                    Text("Recipes")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)

                    Spacer()

                    NavigationLink {
                        FavouriteListView()   // <-- Your Favourite Screen
                    } label: {
                        Image(systemName: "heart.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding(10)
                    }
                }
                .padding(.top)

                // Animated Icon
                Image(systemName: animatedIcons[animatedIconIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.orange)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                            withAnimation(.easeInOut(duration: 1)) {
                                animatedIconIndex = (animatedIconIndex + 1) % animatedIcons.count
                            }
                        }
                    }

                // Vegetable Selection
                VStack(alignment: .center, spacing: 15) {
                    Text("Select Vegetable")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(vegetables, id: \.self) { veg in
                                Button {
                                    withAnimation(.spring()) {
                                        selectedVegetable = veg
                                    }
                                } label: {
                                    VStack(spacing: 8) {
                                        Image(systemName: vegetableIcons[veg] ?? "leaf.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(selectedVegetable == veg ? .white : .green)
                                        Text(veg)
                                            .font(.headline)
                                            .foregroundColor(selectedVegetable == veg ? .white : .primary)
                                    }
                                    .padding(14)
                                    .background(selectedVegetable == veg ? Color.orange : Color(.systemGray6))
                                    .cornerRadius(16)
                                    .shadow(color: selectedVegetable == veg ? Color.orange.opacity(0.4) : Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    }
                }

                // Meal Type Selection
                VStack(alignment: .center, spacing: 15) {
                    Text("Select Meal Type")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)

                    HStack(spacing: 20) {
                        ForEach(mealTypes, id: \.self) { meal in
                            Button {
                                withAnimation(.spring()) {
                                    selectedMealType = meal
                                }
                            } label: {
                                VStack(spacing: 8) {
                                    Image(systemName: mealIcons[meal] ?? "fork.knife")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(selectedMealType == meal ? .white : .orange)
                                    Text(meal)
                                        .font(.headline)
                                        .foregroundColor(selectedMealType == meal ? .white : .primary)
                                }
                                .padding(14)
                                .background(selectedMealType == meal ? Color.orange : Color(.systemGray6))
                                .cornerRadius(16)
                                .shadow(color: selectedMealType == meal ? Color.orange.opacity(0.4) : Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }

                // Show Recipes Button
                NavigationLink {
                    RecipeListView(vegetable: selectedVegetable)
                } label: {
                    HStack {
                        Image(systemName: "book.fill")
                        Text("Show Recipes")
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedVegetable.isEmpty ? Color.gray : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .shadow(color: Color.orange.opacity(0.3), radius: 4, x: 0, y: 3)
                }
                .disabled(selectedVegetable.isEmpty)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.vertical)
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }

    struct RecipeMainView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                RecipeMainView()
            }
        }
    }
