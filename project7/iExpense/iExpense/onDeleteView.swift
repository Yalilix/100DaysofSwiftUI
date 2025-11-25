//
//  onDeleteView.swift
//  iExpense
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct onDeleteView: View {
  @State private var numbers = [Int]()
  @State private var currentNumber = 1

  var body: some View {
    NavigationStack {
      VStack {
          List {
              ForEach(numbers, id: \.self) {
                  Text("Row \($0)")
              }
              .onDelete(perform: removeRows)
          }

          Button("Add Number") {
              numbers.append(currentNumber)
              currentNumber += 1
          }
      }
      .toolbar {
          EditButton()
      }
    }
  }
  
  func removeRows(at offsets: IndexSet) {
      numbers.remove(atOffsets: offsets)
  }
}

#Preview {
    onDeleteView()
}
