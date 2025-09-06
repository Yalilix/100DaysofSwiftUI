//
//  ContentView.swift
//  WeSplit
//
//  Created by Yanlin Li  on 1/9/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipSelection = 20
  @FocusState private var amountIsFocused: Bool
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var checkTotal: Double {
    let tipDecimal = Double(tipSelection) / 100
    let tipAmount = checkAmount * tipDecimal
    
    return checkAmount + tipAmount
  }
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    
    return checkTotal / peopleCount
  }
  
    var body: some View {
      NavigationStack {
        Form {
          Section("Amount") {
            TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
              .keyboardType(.decimalPad)
              .focused($amountIsFocused)
            
            Picker("Number of people", selection: $numberOfPeople) {
              ForEach(2..<100) {
                Text("\($0) people")
              }
            }
            .pickerStyle(.navigationLink)
          }
          
          Section("How much tip do you want to leave?") {
            Picker("Tip percentage", selection: $tipSelection) {
              ForEach(tipPercentages, id: \.self) {
                Text($0, format: .percent)
              }
            }
            .pickerStyle(.segmented)
          }
          
          Section("Check Total") {
            Text(checkTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
          }
          
          Section("Amount Per Person") {
            Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
          }
        }
        .navigationTitle("WeSplit")
        .toolbar {
          if amountIsFocused {
            Button("Done") {
              amountIsFocused = false
            }
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
