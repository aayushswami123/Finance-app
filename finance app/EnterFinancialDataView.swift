//
//  EnterFinancialDataView.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//
import SwiftUI
import SwiftData

struct EnterFinancialDataView: View {
    @ObservedObject var viewModel: FinanceViewModel
    @State private var incomeText: String = ""
    @State private var expensesText: String = ""
    @State private var savingsText: String = ""
    @State private var selectedCategory: FinancialData.ExpenseCategory = .miscellaneous
    @State private var date = Date()
    @State private var showingSaveConfirmation = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Financial Data")) {
                    TextField("Income ($)", text: $incomeText)
                        .keyboardType(.decimalPad)
                    
                    TextField("Expenses ($)", text: $expensesText)
                        .keyboardType(.decimalPad)
                    
                    TextField("Savings ($)", text: $savingsText)
                        .keyboardType(.decimalPad)
                    
                    Picker("Expense Category", selection: $selectedCategory) {
                        ForEach(FinancialData.ExpenseCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                
                Button("Save") {
                    if saveData() {
                        showingSaveConfirmation = true
                    }
                }
            }
            .navigationTitle("Enter Financial Data")
            .alert("Data Saved", isPresented: $showingSaveConfirmation) {
                Button("OK") { }
            } message: {
                Text("Your financial data has been saved successfully.")
            }
        }
    }
    
    private func saveData() -> Bool {
        guard let income = Double(incomeText),
              let expenses = Double(expensesText),
              let savings = Double(savingsText) else { return false }
        
        // Create new record
        let record = FinancialData(date: date, income: income, expenses: expenses, savings: savings, expenseCategory: selectedCategory)
        
        // Add record
        viewModel.addRecord(record)
        
        // Clear input fields
        incomeText = ""
        expensesText = ""
        savingsText = ""
        date = Date()
        
        return true
    }
}

struct EnterFinancialDataView_Previews: PreviewProvider {
    static var previews: some View {
        EnterFinancialDataView(viewModel: FinanceViewModel())
    }
}
