//import SwiftUI
//
//struct LoginView: View {
//    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
//    @AppStorage("loggedInUsername") var loggedInUsername: String = ""
//
//    @State private var email = ""
//    @State private var password = ""
//    @State private var showRegister = false
//    @State private var errorMessage = ""
//
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                Text("Login")
//                    .font(.largeTitle)
//                    .bold()
//
//                TextField("Email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .autocapitalization(.none)
//
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                if !errorMessage.isEmpty {
//                    Text(errorMessage).foregroundColor(.red)
//                }
//
//                Button("Login") {
//                    login()
//                }
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.orange)
//                .foregroundColor(.white)
//                .cornerRadius(12)
//
//                Button("Don't have an account? Register") {
//                    showRegister.toggle()
//                }
//                .sheet(isPresented: $showRegister) {
//                    RegisterView()
//                }
//            }
//            .padding()
//        }
//    }
//
//    func login() {
//        if let user = UserManager.shared.loginUser(email: email, password: password) {
//            // Set AppStorage for username
//            loggedInUsername = user.username ?? ""
//            isLoggedIn = true
//        } else {
//            errorMessage = "Invalid email or password"
//        }
//    }
//}
import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("loggedInUsername") var loggedInUsername: String = ""
    
    // REQUIRED for favourites
    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    @AppStorage("loggedInPassword") var loggedInPassword: String = ""

    @State private var email = ""
    @State private var password = ""
    @State private var showRegister = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Button("Login") {
                    login()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(12)

                Button("Don't have an account? Register") {
                    showRegister.toggle()
                }
                .sheet(isPresented: $showRegister) {
                    RegisterView()
                }
            }
            .padding()
        }
    }

    func login() {
        if let user = UserManager.shared.loginUser(email: email, password: password) {

            // Save username for UI
            loggedInUsername = user.username ?? ""
            isLoggedIn = true

            // ❗IMPORTANT: save these for favourite system
            loggedInEmail = email
            loggedInPassword = password

        } else {
            errorMessage = "Invalid email or password"
        }
    }
}
