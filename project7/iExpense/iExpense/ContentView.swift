//  ContentView.swift
//
//  iExpense
//
//  Created by Yanlin Li  on 25/11/2025.
//

import Observation
import SwiftUI

@Observable
class Expenses {
  init() {
      if let savedItems = UserDefaults.standard.data(forKey: "Items") {
          if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
              items = decodedItems
              return
          }
      }

      items = []
  }
  
  var items = [ExpenseItem]() {
      didSet {
          if let encoded = try? JSONEncoder().encode(items) {
              UserDefaults.standard.set(encoded, forKey: "Items")
          }
      }
  }
}

struct ContentView: View {
  @State private var expenses = Expenses()
  @State private var showingAddExpense = false

  var body: some View {
    NavigationStack {
      List {
        Section("Personal") {
          ForEach(expenses.items.filter {$0.type == "Personal" }) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }

                Spacer()
              Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(item.amount < 10.0 ? .blue : item.amount < 100.0 ? .red : .green)
            }
          }
          .onDelete(perform: removeItems)
        }
        
        Section("Business") {
          ForEach(expenses.items.filter {$0.type == "Business" }) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }

                Spacer()
              Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(item.amount < 10.0 ? .blue : item.amount < 100.0 ? .red : .green)
            }
          }
          .onDelete(perform: removeItems)
        }
        
        
      }
      .navigationTitle("iExpense")
      .toolbar {
//        Button("Add Expense", systemImage: "plus") {
//          showingAddExpense = true
//        }
        
        NavigationLink {
            AddView(expenses: expenses)
        } label: {
            Label("Add Expense", systemImage: "plus")
        }
      }
      .sheet(isPresented: $showingAddExpense) {
          AddView(expenses: expenses)
      }
      .navigationDestination(for: ExpenseItem.self) { selection in
          Text("You selected \(selection)")
      }
      
    }
  }
  
  func removeItems(at offsets: IndexSet) {
      expenses.items.remove(atOffsets: offsets)
  }
}

#Preview {
    ContentView()
}
