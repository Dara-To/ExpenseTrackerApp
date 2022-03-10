//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Dara To on 2022-03-04.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
