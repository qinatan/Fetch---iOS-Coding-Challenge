import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MealViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.mealID)) {
                    MealRow(meal: meal)
                }
            }
            .navigationTitle("Meals")
            .onAppear {
                viewModel.fetchMeals()
            }
        }
    }
}
