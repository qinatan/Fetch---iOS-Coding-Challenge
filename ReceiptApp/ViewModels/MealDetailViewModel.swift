import Foundation


class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?

    init(mealID: String?) {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            self.mealDetail = MealDetail(
                mealID: "1",
                mealName: "Sample Meal",
                mealInstructions: "Sample instructions for this meal. This is a detailed description of how to prepare the meal.",
                mealIngredients: ["Ingredient 1", "Ingredient 2"],
                mealMeasures: ["1 cup", "2 tbsp"]
            )
        } else if let mealID = mealID {
            fetchMealDetails(mealID: mealID)
        }
    }

    func fetchMealDetails(mealID: String) {
        Task {
            do {
                if let fetchedMealDetail = try await MealService.shared.fetchMealDetails(mealID: mealID) {
                    DispatchQueue.main.async {
                        self.mealDetail = fetchedMealDetail
                    }
                }
            } catch {
                print("Error fetching meal details: \(error)")
            }
        }
    }

    static let preview = MealDetailViewModel(mealID: nil)
}
