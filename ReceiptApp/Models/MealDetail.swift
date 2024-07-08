import Foundation


struct MealDetail: Codable{
    let mealID: String?
    let mealName: String?
    let mealInstructions: String?
    var mealIngredients: [String] = []
    var mealMeasures: [String] = []
    
    enum MealDetailsKeys: String, CodingKey{
        case mealID = "idMeal"
        case mealName = "strMeal"
        case mealInstructions = "strInstructions"
    }
    
    var isValid : Bool{
        return  (mealID != nil && !mealID!.isEmpty) &&
                (mealName != nil && !mealName!.isEmpty) &&
                (mealInstructions != nil && !mealInstructions!.isEmpty)
    }
    
    struct DynamicCodingKeys: CodingKey {
            var stringValue: String
            var intValue: Int?

            init?(stringValue: String) {
                self.stringValue = stringValue
            }

            init?(intValue: Int) {
                self.intValue = intValue
                self.stringValue = "\(intValue)"
            }
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MealDetailsKeys.self)
        mealID = try? container.decodeIfPresent(String.self, forKey: .mealID)
        mealName = try? container.decodeIfPresent(String.self, forKey: .mealName)
        mealInstructions = try? container.decodeIfPresent(String.self, forKey: .mealInstructions)
        
        var ingredients: [String] = []
        var measures: [String] = []
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        for index in 1...20 {
            guard let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(index)"),
                  let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(index)") else {
                   continue
               }
            if let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty{
                ingredients.append(ingredient)
            }
            if let measure = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey), !measure.isEmpty{
                measures.append(measure)
            }
        }
        
        mealIngredients = ingredients
        mealMeasures = measures
    }
}


struct MealDetailResponse : Decodable{
    let meals: [MealDetail]
}
