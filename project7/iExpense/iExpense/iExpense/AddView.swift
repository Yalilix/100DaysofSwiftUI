//
//  AddView.swift
//  iExpense
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct AddView: View {
  
  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = 0.0
  @State private var title = "Add new expense"
  
  var expenses: Expenses

  let types = ["Business", "Personal"]
  var body: some View {
    NavigationStack {
      Form {
        TextField("Name", text: $name)
        
        Picker("Type", selection: $type) {
          ForEach(types, id: \.self) {
            Text($0)
          }
        }
        
        TextField("Amount", value: $amount, format: .currency(code: "USD"))
          .keyboardType(.decimalPad)
      }
      .navigationTitle($title)
      .navigationBarTitleDisplayMode(.inline)
//      .toolbar {
//          Button("Save") {
//              let item = ExpenseItem(name: name, type: type, amount: amount)
//              expenses.items.append(item)
//            dismiss()
//          }
//      }
      .navigationBarBackButtonHidden(true)
      .toolbar {
          ToolbarItem(placement: .cancellationAction) {
              Button("Cancel") {
                  dismiss()
              }
          }
          
          ToolbarItem(placement: .confirmationAction) {
              Button("Save") {
                  let item = ExpenseItem(name: name, type: type, amount: amount)
                  expenses.items.append(item)
                  dismiss()
              }
          }
      }
    }
  }
  
  @Environment(\.dismiss) var dismiss
}

#Preview {
    AddView(expenses: Expenses())
}
