import SwiftUI

struct MealRow: View {
    let meal: Meal

    var body: some View {
        HStack {
            if let thumbnail = meal.mealThumbnail, let url = URL(string: thumbnail) {
                AsyncImage(url: url) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 50, height: 50)
                         .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            Text(meal.mealName ?? "Unknown")
        }
    }
}
