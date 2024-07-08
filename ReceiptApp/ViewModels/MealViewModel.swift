import Foundation


class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    func fetchMeals() {
        Task {
            do {
                let fetchedMeals = try await MealService.shared.fetchMeals()
                DispatchQueue.main.async {
                    self.meals = fetchedMeals
                }
            } catch {
                print("Error fetching meals: \(error)")
            }
        }
    }
}
