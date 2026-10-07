////
////  ProfileView.swift
////  Recipe
////
////  Created by BMIIT on 25/11/25.
////
//
//import Foundation
//import SwiftUI
//import CoreData
//
//struct ProfileView: View {
//    @Binding var isLoggedIn: Bool
//    @Binding var loggedInUsername: String
//
//    @State private var username: String = ""
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var message: String = ""
//
//    let context = PersistenceController.shared.container.viewContext
//
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                Text("Profile")
//                    .font(.largeTitle)
//                    .bold()
//
//                TextField("Username", text: $username)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                TextField("Email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .disabled(true) // email is usually not editable
//
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                if !message.isEmpty {
//                    Text(message)
//                        .foregroundColor(.green)
//                }
//
//                Button("Update Profile") {
//                    updateProfile()
//                }
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(12)
//
//                Button("Logout") {
//                    isLoggedIn = false
//                    loggedInUsername = ""
//                }
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.red)
//                .foregroundColor(.white)
//                .cornerRadius(12)
//
//                Spacer()
//            }
//            .padding()
//            .onAppear(perform: loadUserDetails)
//        }
//    }
//
//    func loadUserDetails() {
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "username == %@", loggedInUsername)
//
//        do {
//            if let user = try context.fetch(fetchRequest).first {
//                username = user.username ?? ""
//                email = user.email ?? ""
//                password = user.password ?? ""
//            }
//        } catch {
//            print("Fetch user error: \(error)")
//        }
//    }
//
//    func updateProfile() {
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "username == %@", loggedInUsername)
//
//        do {
//            if let user = try context.fetch(fetchRequest).first {
//                user.username = username
//                if !password.isEmpty {
//                    user.password = password
//                }
//                try context.save()
//
//                // Update AppStorage username if changed
//                loggedInUsername = username
//
//                message = "Profile updated successfully!"
//            }
//        } catch {
//            print("Update user error: \(error)")
//            message = "Failed to update profile."
//        }
//    }
//}



import SwiftUI

struct ProfileView: View {
    @Binding var isLoggedIn: Bool
    @Binding var loggedInUsername: String

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {

                Text("Welcome, \(loggedInUsername)")
                    .font(.title2)
                    .bold()

                NavigationLink("My Favourites ⭐") {
                    FavouriteListView()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(12)

                Button("Logout") {
                    isLoggedIn = false
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)

                Spacer()
            }
            .padding()
        }
    }
}
