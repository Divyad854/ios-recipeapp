import Foundation
import CoreData

class UserManager {
    static let shared = UserManager()
    let context = PersistenceController.shared.container.viewContext

    // MARK: - Register
    func registerUser(username: String, email: String, password: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)

        do {
            let users = try context.fetch(fetchRequest)
            if !users.isEmpty { return false }

            let newUser = User(context: context)
            newUser.username = username
            newUser.email = email
            newUser.password = password

            // Empty arrays
            newUser.favouriteIDs = [] as NSObject
            newUser.favouriteNames = [] as NSObject
            newUser.favouriteImages = [] as NSObject

            try context.save()
            return true
        } catch {
            print("Register error: \(error)")
            return false
        }
    }

    // MARK: - Login
    func loginUser(email: String, password: String) -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)

        do {
            return try context.fetch(request).first
        } catch {
            print("Login error:", error)
            return nil
        }
    }

    // MARK: - Check Favourite
    func isFavourite(user: User, id: String) -> Bool {
        let ids = user.favouriteIDs as? [String] ?? []
        return ids.contains(id)
    }

    // MARK: - Add Favourite
    func addFavourite(for user: User, id: String, name: String, image: String) {

        var ids = user.favouriteIDs as? [String] ?? []
        var names = user.favouriteNames as? [String] ?? []
        var images = user.favouriteImages as? [String] ?? []

        if !ids.contains(id) {
            ids.append(id)
            names.append(name)
            images.append(image)
        }

        user.favouriteIDs = ids as NSObject
        user.favouriteNames = names as NSObject
        user.favouriteImages = images as NSObject

        try? context.save()
    }

    // MARK: - Remove Favourite
    func removeFavourite(for user: User, id: String) {
        var ids = user.favouriteIDs as? [String] ?? []
        var names = user.favouriteNames as? [String] ?? []
        var images = user.favouriteImages as? [String] ?? []

        if let index = ids.firstIndex(of: id) {
            ids.remove(at: index)
            names.remove(at: index)
            images.remove(at: index)
        }

        user.favouriteIDs = ids as NSObject
        user.favouriteNames = names as NSObject
        user.favouriteImages = images as NSObject

        try? context.save()
    }
}
