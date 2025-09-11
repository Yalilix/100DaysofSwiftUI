//
//  ContentView.swift
//  UnitConversion
//
//  Created by Yanlin Li  on 6/9/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var input: Double = 0.0
  @State private var inputConversion: String = "seconds"
  @State private var outputConversion: String = "seconds"
  @FocusState private var isFocused: Bool
  
  let conversionOptions = ["seconds", "minutes", "hours", "days"]
  let conversionMap = ["seconds": 1, "minutes": 60, "hours": 3600, "days": 86400]
  
  
  var output: Double {
    var result = input
    if inputConversion == outputConversion {
      return input
    }
    
    if inputConversion != "seconds" {
      result = result * Double(conversionMap[inputConversion]!)
    }
    
    if outputConversion != "seconds" {
      return result / Double(conversionMap[outputConversion]!)
    } else {
      return result
    }
  }
  
  var body: some View {
    NavigationStack {
      Form {
        Section("Enter Time") {
          TextField("Enter time", value: $input, format: .number)
            .keyboardType(.decimalPad)
            .focused($isFocused)
          
          Picker("Current conversion", selection: $inputConversion) {
            ForEach(conversionOptions, id: \.self) { option in
              Text(option)
            }
          }
          Picker("Output conversion", selection: $outputConversion) {
            ForEach(conversionOptions, id: \.self) { option in
              Text(option)
            }
          }
        }
        
        Section("\(input) from \(inputConversion) to \(outputConversion)") {
          Text(output, format: .number)
        }
      }
      .navigationTitle("Unit Conversion")
      .toolbar {
        if isFocused {
          Button("Done") {
            isFocused = false
          }
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
