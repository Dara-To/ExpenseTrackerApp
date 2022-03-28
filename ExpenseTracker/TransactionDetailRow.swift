//
//  TransactionDetailRow.swift
//  ExpenseTracker
//
//  Created by Dara To on 2022-03-27.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionDetailRow: View {
    var icon: FontAwesomeCode
    var title: String
    var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            // MARK: Icon
            FontIcon.text(.awesome5Solid(code: icon), fontsize: 24, color: Color.icon)
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Title
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // MARK: Text
                Text(text)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 8)
    }
}

struct TransactionDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionDetailRow(icon: .store, title: "Merchant", text: "Apple")
            TransactionDetailRow(icon: .store, title: "Merchant", text: "Apple")
                .preferredColorScheme(.dark)
        }
    }
}
