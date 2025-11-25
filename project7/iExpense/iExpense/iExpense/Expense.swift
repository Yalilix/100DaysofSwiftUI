//
//  Expense.swift
//  iExpense
//
//  Created by Yanlin Li  on 25/11/2025.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Double
}
