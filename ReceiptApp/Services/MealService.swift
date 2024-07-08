import Foundation

class MealService{
    static let shared = MealService()
    
    func fetchMeals() async throws -> [Meal]{
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else{
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let mealCollection = try JSONDecoder().decode(MealResponse.self, from: data)
        let validMeals = mealCollection.meals.filter{$0.isValid}
        return validMeals.sorted {($0.mealName! < $1.mealName!)}
    }
    
    func fetchMealDetails(mealID: String) async throws -> MealDetail? {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let mealDetailCollection = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        let validMealDetail = mealDetailCollection.meals.filter { $0.isValid }
        return validMealDetail.first
    }

}
