import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var dessertList: [Dessert] = []
    
    // func fetchDesserts fetches results inside mealDB Desserts category
    func fetchDesserts() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("No desserts received. \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.global().async {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(DessertsModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.dessertList = decodedData.meals
                    }
                } catch {
                    print("Error in decoding desserts. \(error)")
                }
            }
        }.resume()
    }
}
