import Foundation

class DessertDetailViewModel: ObservableObject {
    @Published var dessertDetailsData: [DessertDetail] = []
    var ingredientMeasurement: [String?:String?] = [:]
    var ingredients: [String?] = []
    var measures: [String?] = []

    func fetchDessertDetails(forID id: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error in getting details. \(error?.localizedDescription ?? "We don't know.")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(DessertDetails.self, from: data)
                self.dessertDetailsData = decodedData.meals
                
                self.ingredients = [
                    self.dessertDetailsData[0].strIngredient1,
                    self.dessertDetailsData[0].strIngredient2,
                    self.dessertDetailsData[0].strIngredient3,
                    self.dessertDetailsData[0].strIngredient4,
                    self.dessertDetailsData[0].strIngredient5,
                    self.dessertDetailsData[0].strIngredient6,
                    self.dessertDetailsData[0].strIngredient7,
                    self.dessertDetailsData[0].strIngredient8,
                    self.dessertDetailsData[0].strIngredient9,
                    self.dessertDetailsData[0].strIngredient10,
                    self.dessertDetailsData[0].strIngredient11,
                    self.dessertDetailsData[0].strIngredient12,
                    self.dessertDetailsData[0].strIngredient13,
                    self.dessertDetailsData[0].strIngredient14,
                    self.dessertDetailsData[0].strIngredient15,
                    self.dessertDetailsData[0].strIngredient16,
                    self.dessertDetailsData[0].strIngredient17,
                    self.dessertDetailsData[0].strIngredient18,
                    self.dessertDetailsData[0].strIngredient19,
                    self.dessertDetailsData[0].strIngredient20
                ]
                
                self.measures = [
                    self.dessertDetailsData[0].strMeasure1,
                    self.dessertDetailsData[0].strMeasure2,
                    self.dessertDetailsData[0].strMeasure3,
                    self.dessertDetailsData[0].strMeasure4,
                    self.dessertDetailsData[0].strMeasure5,
                    self.dessertDetailsData[0].strMeasure6,
                    self.dessertDetailsData[0].strMeasure7,
                    self.dessertDetailsData[0].strMeasure8,
                    self.dessertDetailsData[0].strMeasure9,
                    self.dessertDetailsData[0].strMeasure10,
                    self.dessertDetailsData[0].strMeasure11,
                    self.dessertDetailsData[0].strMeasure12,
                    self.dessertDetailsData[0].strMeasure13,
                    self.dessertDetailsData[0].strMeasure14,
                    self.dessertDetailsData[0].strMeasure15,
                    self.dessertDetailsData[0].strMeasure16,
                    self.dessertDetailsData[0].strMeasure17,
                    self.dessertDetailsData[0].strMeasure18,
                    self.dessertDetailsData[0].strMeasure19,
                    self.dessertDetailsData[0].strIngredient20
                ]
                
                for x in 0...19 {
                    self.ingredientMeasurement[self.ingredients[x]] = self.measures[x]
                }

            } catch {
                print("Error in decoding dessert details. \(error)")
            }
        }.resume()
    }
}
