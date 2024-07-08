import SwiftUI

struct MealListView: View {
    @State private var meals: [Meal] = []
    @State private var selectedMeal: MealDetail?
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            List(meals, id: \.mealID) { meal in
                NavigationLink(
                    destination: MealDetailView(mealID: meal.mealID),
                    label: {
                        MealRowView(meal: meal)
                    })
            }
            .navigationTitle("Meals")
            .onAppear {
                Task {
                    await fetchMeals()
                }
            }
        }
    }
    
    private func fetchMeals() async {
        do {
            let fetchedMeals = try await MealService.shared.fetchMeals()
            DispatchQueue.main.async {
                self.meals = fetchedMeals
                self.isLoading = false
            }
        } catch {
            print("Error fetching meals: \(error)")
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}

