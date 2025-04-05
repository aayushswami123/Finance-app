//
//  InsightsView.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//

import SwiftUI
import Charts

struct InsightsView: View {
    @ObservedObject var viewModel: FinanceViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.insightText)
                    .font(.title)
                    .padding()
                
                
                if !viewModel.records.isEmpty {
                    Chart {
                        ForEach(viewModel.records) { record in
                            BarMark(
                                x: .value("Date", record.date, unit: .day),
                                y: .value("Income", record.income)
                            )
                            .foregroundStyle(.blue)
                            
                            BarMark(
                                x: .value("Date", record.date, unit: .day),
                                y: .value("Expenses", record.expenses)
                            )
                            .foregroundStyle(.red)
                        }
                    }
                    .frame(height: 300)
                    .padding()
                }
                
                Spacer()
            }
            .navigationTitle("How Am I Doing?")
        }
    }
}

struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(viewModel: FinanceViewModel())
    }
}
