# Personal Finance Tracker App

## 📱 Overview

**Personal Finance Tracker** is an iOS application built using **SwiftUI** and **SwiftData** that helps users track their daily financial activity. With easy data entry, insightful analysis, and clear visualizations, it empowers individuals to manage income, expenses, and savings more effectively.

## ✨ Features

- **📊 Enter Financial Data:**  
  Users can log daily income, expenses, savings, and select an expense category (e.g., Food, Entertainment, Transportation, Rent/Mortgage, Miscellaneous). A date picker ensures accurate logging of each entry.

- **📅 View My Finances:**  
  Displays a summary of financial activity from the past 7 days, helping users reflect on recent spending habits.

- **🧠 How Am I Doing?:**  
  Analyzes your financial data and provides insights using calculated ratios. A bar chart visually compares daily income vs. expenses, highlighting areas for improvement.

## 🧱 Architecture

This app follows the **MVVM (Model-View-ViewModel)** design pattern:

- **Model:**  
  Defined in `FinancialData.swift`. It represents financial records, including income, expenses, savings, date, and category.

- **View:**  
  Built with **SwiftUI**:
  - `ContentView.swift` – Main tabbed interface  
  - `EnterFinancialDataView.swift` – Form to input financial entries  
  - `InsightsView.swift` – Displays analytical insights and visualizations

- **ViewModel:**  
  `FinanceViewModel.swift` manages business logic: adding, sorting, filtering records, and computing insights.

## 🚀 Getting Started

### Requirements

- Xcode 15+
- iOS 17+
- Swift 5

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/aayushswami123/Finance-app.git
   ```

2. **Open the project:**
   ```bash
   cd PersonalFinanceTrackerApp
   open PersonalFinanceTrackerApp.xcodeproj
   ```

3. **Build and run:**  
   Choose your simulator or connected device in Xcode and press **Run** ▶️.

## 🧭 How to Use

- **Enter Data:**  
  Go to the **"Enter Data"** tab. Input income, expenses, savings, category, and date, then tap **Save** to store your data.

- **View My Finances:**  
  The **"My Finances"** tab shows a summary of the past 7 days.

- **Insights:**  
  Navigate to the **"Insights"** tab to view calculated ratios and a bar chart comparing income vs. expenses, alongside personalized feedback (e.g., "You are saving well!" or "You are overspending!").

## 🗂 Project Structure

| File                             | Description                                                                 |
|----------------------------------|-----------------------------------------------------------------------------|
| `PersonalFinanceTrackerApp.swift` | App entry point and environment setup                                       |
| `ContentView.swift`              | Main UI with tab navigation                                                |
| `EnterFinancialDataView.swift`   | View for entering new financial data                                       |
| `InsightsView.swift`             | View showing financial insights and chart                                  |
| `FinanceViewModel.swift`         | ViewModel with logic for data management and insights                       |
| `FinancialData.swift`            | Model defining the structure of financial records                          |
| `Homework2.pdf`                  | Assignment prompt and specifications that guided app development           |

## 📚 External Resources

- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)  
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)  
- [Swift Charts Documentation](https://developer.apple.com/documentation/charts)

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgements

- Developed as part of **Homework #2**.
- Special thanks to the course instructors and Apple Developer resources for inspiration and guidance.
