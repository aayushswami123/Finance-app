//
//  ViewFinancesView.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//
import SwiftUI

struct ViewFinancesView: View {
    @ObservedObject var viewModel: FinanceViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.records) { record in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(record.date, style: .date)
                            .font(.headline)
                        Text("Income: $\(record.income, specifier: "%.2f")")
                        Text("Expenses: $\(record.expenses, specifier: "%.2f")")
                        Text("Savings: $\(record.savings, specifier: "%.2f")")
                        Text("Category: \(record.expenseCategory.rawValue)")
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("My Finances")
        }
    }
}

struct ViewFinancesView_Previews: PreviewProvider {
    static var previews: some View {
        ViewFinancesView(viewModel: FinanceViewModel())
    }
}

