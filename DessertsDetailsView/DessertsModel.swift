import Foundation

// models after the desserts results
struct DessertsModel: Decodable {
    let meals: [Dessert]
}

struct Dessert: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
