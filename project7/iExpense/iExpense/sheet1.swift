//
//  sheet1.swift
//  iExpense
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct sheet1: View {
  @State private var showingSheet = false
  
    var body: some View {
      Button("Show Sheet") {
        showingSheet.toggle()
      }
      .sheet(isPresented: $showingSheet) {
        SecondView(name: "@twostraws")
      }
    }
}

struct SecondView: View {
  let name: String
  var body: some View {
    Text("Hello, \(name)!")
    Button("Dismiss") {
        dismiss()
    }
  }
  
  @Environment(\.dismiss) var dismiss
}

#Preview {
    sheet1()
}
