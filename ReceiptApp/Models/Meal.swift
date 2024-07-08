import Foundation

struct Meal: Identifiable, Codable{
    var id: String {mealID}
    let mealID: String
    let mealName: String?
    let mealThumbnail: String?
    
    //map JSON key to Meal property key of struct Meal
    enum MealKeys: String, CodingKey{
        case mealID = "idMeal"
        case mealName = "strMeal"
        case mealThumbnail = "strMealThumb"
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: MealKeys.self)
        mealID = try container.decode(String.self, forKey: .mealID)
        mealName = try? container.decodeIfPresent(String.self, forKey: .mealName)
        mealThumbnail = try? container.decodeIfPresent(String.self, forKey: .mealThumbnail)
    }
    
    var isValid: Bool{
        return (!mealID.isEmpty) && (mealName != nil && !mealName!.isEmpty)
    }
}

struct MealResponse: Decodable{
    let meals: [Meal]
}


