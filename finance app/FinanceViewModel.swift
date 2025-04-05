//
//  FinanceViewModel.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//

import SwiftUI
import SwiftData

class FinanceViewModel: ObservableObject {
    @Published var records: [FinancialData] = []
    private var modelContext: ModelContext?
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        if let modelContext = modelContext {
            fetchRecords(modelContext: modelContext)
        }
    }
    
    // Set the model context if it wasn't available during initialization
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        print("Model context set")
        fetchRecords(modelContext: context)
    }
    
    private func fetchRecords(modelContext: ModelContext) {
        do {
            let descriptor = FetchDescriptor<FinancialData>(sortBy: [SortDescriptor(\.date, order: .reverse)])
            let allRecords = try modelContext.fetch(descriptor)
            print("Fetched \(allRecords.count) records")
            
            // Only keep the most recent 7 days of data as per requirements
            records = allRecords.count > 7 ? Array(allRecords.prefix(7)) : allRecords
            print("Updated records array with \(records.count) items")
        } catch {
            print("Failed to fetch records: \(error)")
        }
    }
    
    func addRecord(_ record: FinancialData) {
        guard let modelContext = modelContext else {
            print("ModelContext is nil, cannot save record")
            return
        }
        
        print("Adding record with date: \(record.date), income: \(record.income)")
        modelContext.insert(record)
        
        // Save changes
        do {
            try modelContext.save()
            print("Record saved successfully")
            // Refresh the records
            fetchRecords(modelContext: modelContext)
        } catch {
            print("Failed to save record: \(error)")
        }
    }
    
    var totalIncome: Double {
        records.reduce(0) { $0 + $1.income }
    }
    
    var totalExpenses: Double {
        records.reduce(0) { $0 + $1.expenses }
    }
    
    var totalSavings: Double {
        records.reduce(0) { $0 + $1.savings }
    }
    
    var averageIncome: Double {
        records.isEmpty ? 0 : totalIncome / Double(records.count)
    }
    
    var averageExpenses: Double {
        records.isEmpty ? 0 : totalExpenses / Double(records.count)
    }
    
    var averageSavings: Double {
        records.isEmpty ? 0 : totalSavings / Double(records.count)
    }
    
    var insightText: String {
        guard averageIncome > 0 else { return "No data available." }
        let expenseRatio = averageExpenses / averageIncome
        let savingsRatio = averageSavings / averageIncome
        
        if expenseRatio > 0.30 {
            return "You are overspending!"
        } else if savingsRatio >= 0.10 && savingsRatio <= 0.30 {
            return "You have a balanced budget!"
        } else if savingsRatio > 0.30 {
            return "You are saving well!"
        } else {
            return "Keep tracking your finances for more insights."
        }
    }
}
