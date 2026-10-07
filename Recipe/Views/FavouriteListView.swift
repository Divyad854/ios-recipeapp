import SwiftUI

struct FavouriteListView: View {

    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    @AppStorage("loggedInPassword") var loggedInPassword: String = ""

    @State private var ids: [String] = []
    @State private var names: [String] = []
    @State private var images: [String] = []

    var body: some View {
        List {
            ForEach(ids.indices, id: \.self) { index in
                HStack {
                    AsyncImage(url: URL(string: images[index])) { img in
                        img.resizable()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)

                    Text(names[index])
                        .font(.headline)
                }
            }
        }
        .onAppear(perform: loadFavourites)
        .navigationTitle("My Favourites")
    }

    func loadFavourites() {
        guard let user = UserManager.shared.loginUser(
            email: loggedInEmail,
            password: loggedInPassword
        ) else { return }

        ids = user.favouriteIDs as? [String] ?? []
        names = user.favouriteNames as? [String] ?? []
        images = user.favouriteImages as? [String] ?? []
    }
}
