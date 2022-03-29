//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Dara To on 2022-03-28.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    // MARK: Subcategories
                    ForEach(category.subcategories ?? []) { subcategory in
                        let isSelected = transaction.categoryId == subcategory.id
                        
                        CategoryRow(category: subcategory, isSelected: isSelected)
                            .onTapGesture {
                                transactionListVM.updateCategory(transaction: transaction, category: subcategory)
                                dismiss()
                            }
                    }
                } header: {
                    // MARK: Categories
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected)
                        .onTapGesture {
                            transactionListVM.updateCategory(transaction: transaction, category: category)
                            dismiss()
                        }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesView(transaction: transactionPreviewData)
            CategoriesView(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
        .environmentObject(TransactionListViewModel())
    }
}
