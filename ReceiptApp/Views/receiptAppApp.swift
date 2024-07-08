import SwiftUI
import Combine

@main
struct MealsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        MealRow(meal: Meal(mealID: "1", mealName: "Sample Meal", mealThumbnail: "https://www.themealdb.com/images/media/meals/1520084413.jpg"))
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: "1")
    }
}

// Add these initializers to the Meal and MealDetail structs
extension Meal {
    init(mealID: String, mealName: String?, mealThumbnail: String?) {
        self.mealID = mealID
        self.mealName = mealName
        self.mealThumbnail = mealThumbnail
    }
}

extension MealDetail {
    init(mealID: String?, mealName: String?, mealInstructions: String?, mealIngredients: [String], mealMeasures: [String]) {
        self.mealID = mealID
        self.mealName = mealName
        self.mealInstructions = mealInstructions
        self.mealIngredients = mealIngredients
        self.mealMeasures = mealMeasures
    }
}

