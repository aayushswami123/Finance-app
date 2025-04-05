//
//  ContentView.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = FinanceViewModel()
    
    var body: some View {
        TabView {
            EnterFinancialDataView(viewModel: viewModel)
                .tabItem {
                    Label("Enter Data", systemImage: "pencil")
                }
            
            ViewFinancesView(viewModel: viewModel)
                .tabItem {
                    Label("My Finances", systemImage: "list.bullet")
                }
            
            InsightsView(viewModel: viewModel)
                .tabItem {
                    Label("Insights", systemImage: "chart.bar")
                }
        }
        .onAppear {
            // Explicitly set the model context when the view appears
            viewModel.setModelContext(modelContext)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: FinancialData.self, inMemory: true)
}
