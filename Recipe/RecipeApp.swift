//
//  RecipeApp.swift
//  Recipe
//
//  Created by BMIIT on 24/11/25.
//
//
//import SwiftUI
//
//@main
//struct RecipeApp: App {
//    var body: some Scene {
//        WindowGroup {
//            MainTabView()
//        }
//    }
//}
import SwiftUI

@main
struct RecipeApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}
