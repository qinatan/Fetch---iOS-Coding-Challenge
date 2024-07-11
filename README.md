ReceiptApp

ReceiptApp is a SwiftUI-based application that fetches dessert and their details(instruction, ingredients and measures)  
from APIs and displays them. The app is structured using the MVVM (Model-View-ViewModel) architecture to ensure a 
clear separation of concerns and maintainability.

Features

- Fetch dessert meal data from an API
- Display dessert meals in a list view
- View details of each dessert meal

Project Structure

- Models: Contains the data models for the application (Meal.swift, MealDetail.swift).
- Services: Contains the service layer responsible for making API calls (MealService.swift).
- ViewModels: Contains the view models that interact with the services and provide data to the views (MealDetailViewModel.swift, MealViewModel.swift).
- Views: Contains the SwiftUI views that make up the user interface (ContentView.swift, MealDetailView.swift, MealListView.swift, MealRowView.swift).
- receiptAppApp.swift: The main entry point of the application.


Installation

1. git clone https://github.com/your-username/receiptapp.git
2. Open the project in Xcode
3. Build and run the project using Xcode.




