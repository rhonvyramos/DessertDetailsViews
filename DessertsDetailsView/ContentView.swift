import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Get those desserts!") {
                    viewModel.fetchDesserts()
                }
                
                List(viewModel.dessertList, id: \.idMeal) { item in
                    NavigationLink(
                        destination: DessertDetailView(data: item.idMeal),
                        label: {
                            Text(item.strMeal)
                        }
                    )
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
