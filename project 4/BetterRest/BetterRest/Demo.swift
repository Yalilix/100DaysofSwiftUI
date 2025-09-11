//
//  Demo.swift
//  BetterRest
//
//  Created by Yanlin Li  on 10/9/2025.
//

import Foundation
import SwiftUI

struct Demo: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date()

  var body: some View {
    VStack {
      Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
      DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
        .labelsHidden()
      
      Text(Date.now, format: .dateTime.hour().minute())
      Text(Date.now, format: .dateTime.month().year().day())
      
      Text(Date.now.formatted(date: .long, time: .complete))
    }
    .padding()
  }
  
  func getMinHour(date: Date) -> (Int, Int) {
    // Date Specific Type
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? .now
    
    let components2 = Calendar.current.dateComponents([.hour, .minute], from: date)
    let hour = components2.hour ?? 0
    let minute = components2.minute ?? 0
    
    return (hour, minute)
  }
}

#Preview {
  Demo()
}
