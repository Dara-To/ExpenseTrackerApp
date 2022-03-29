//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Dara To on 2022-03-10.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // MARK: Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.offset) { index, transaction in
                NavigationLink {
                    TransactionView(transaction: transaction)
                } label: {
                    TransactionRow(transaction: transaction)
                }
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                RecentTransactionList()
            }
            NavigationView {
                RecentTransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
