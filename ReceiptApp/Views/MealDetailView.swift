import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel: MealDetailViewModel
    let mealID: String?

    init(mealID: String?) {
        self.mealID = mealID
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            _viewModel = StateObject(wrappedValue: MealDetailViewModel.preview)
        } else {
            _viewModel = StateObject(wrappedValue: MealDetailViewModel(mealID: mealID))
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let meal = viewModel.mealDetail {
                    Text(meal.mealName ?? "Unknown")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                    
                    Text("Instructions:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Text(meal.mealInstructions ?? "No instructions available.")
                        .padding(.bottom, 20)
                    
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(Array(zip(meal.mealIngredients, meal.mealMeasures)), id: \.0) { ingredient, measure in
                        HStack {
                            Text(ingredient)
                            Spacer()
                            Text(measure)
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .padding()
        }
        .onAppear {
            if let mealID = mealID, !ProcessInfo.processInfo.environment.keys.contains("XCODE_RUNNING_FOR_PREVIEWS") {
                viewModel.fetchMealDetails(mealID: mealID)
            }
        }
        .navigationTitle("Meal Details")
    }
}
