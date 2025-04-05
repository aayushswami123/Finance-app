//
//  PersonalFinanceTrackerApp.swift
//  finance app
//
//  Created by Apple on 3/8/25.
//

import SwiftUI
import SwiftData

@main
struct PersonalFinanceTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            FinancialData.self,
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            allowsSave: true
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
