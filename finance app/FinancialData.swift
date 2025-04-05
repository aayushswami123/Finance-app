//
//  FinancialData.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//
import Foundation
import SwiftData

@Model
final class FinancialData {
    @Attribute(.unique) var id: UUID
    var date: Date
    var income: Double
    var expenses: Double
    var savings: Double
    var expenseCategoryRawValue: String
    
    init(date: Date = Date(), income: Double = 0.0, expenses: Double = 0.0, savings: Double = 0.0, expenseCategory: ExpenseCategory = .miscellaneous) {
        self.id = UUID()
        self.date = date
        self.income = income
        self.expenses = expenses
        self.savings = savings
        self.expenseCategoryRawValue = expenseCategory.rawValue
    }
    
    var expenseCategory: ExpenseCategory {
        get {
            return ExpenseCategory(rawValue: expenseCategoryRawValue) ?? .miscellaneous
        }
        set {
            expenseCategoryRawValue = newValue.rawValue
        }
    }
    
    enum ExpenseCategory: String, CaseIterable, Identifiable {
        case food = "Food"
        case entertainment = "Entertainment"
        case transportation = "Transportation"
        case rentMortgage = "Rent/Mortgage"
        case miscellaneous = "Miscellaneous"
        
        var id: String { self.rawValue }
    }
}
