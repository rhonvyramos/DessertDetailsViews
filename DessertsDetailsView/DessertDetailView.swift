import SwiftUI

struct DessertDetailView: View {
    @ObservedObject var dessertDetailViewModel = DessertDetailViewModel()
    
    init(data: String) {
        self.dessertDetailViewModel.fetchDessertDetails(forID: data)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text(dessertDetailViewModel.dessertDetailsData[0].strMeal).lineLimit(nil)
                Text(dessertDetailViewModel.dessertDetailsData[0].strInstructions).lineLimit(nil)
                
                ForEach((0...19), id: \.self) {x in
                    if(dessertDetailViewModel.ingredientMeasurement[dessertDetailViewModel.ingredients[x]] != "") {
                        Text("Ingredient \(x + 1): \(dessertDetailViewModel.ingredients[x] ?? ""), Measurement: \(dessertDetailViewModel.measures[x] ?? "")")
                    }
                }
            }
        }

        .padding()
    }
}
