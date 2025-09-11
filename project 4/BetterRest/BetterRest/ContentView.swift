//
//  ContentView.swift
//  BetterRest
//
//  Created by Yanlin Li  on 10/9/2025.
//

import CoreML
import SwiftUI

struct ContentView: View {
  @State private var wakeUp = defaultWakeTime
  @State private var sleepAmount = 8.0
  @State private var coffeeAmount = 1
  
  @State private var alertTitle = ""
  
  var recommendedBedTime: String {
    var recommendedBedTime: String = ""
    do {
      let config = MLModelConfiguration()
      let model = try SleepCalculator(configuration: config)
      
      let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
      let hour = (components.hour ?? 0) * 60 * 60
      let minute = (components.minute ?? 0) * 60
      
      let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
      
      let sleepTime = wakeUp - prediction.actualSleep
      alertTitle = "Your ideal bedtime is…"
      recommendedBedTime = sleepTime.formatted(date: .omitted, time: .shortened)
    } catch {
      alertTitle = "Error"
      recommendedBedTime = "Sorry, there was a problem calculating your bedtime."
    }
    return recommendedBedTime
  }
  
  static var defaultWakeTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? .now
  }
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        } header : {
          Text("When do you want to wake up?")
        }
        
        Section {
          Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        } header : {
          Text("Desired amount of sleep")
        }
        
        Section {
          Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
            ForEach(Array(1...20), id: \.self) { number in
              Text("^[\(number) cup](inflect: true)")
            }
          }
          .pickerStyle(.navigationLink)
        } header: {
          Text("Daily coffee intake")
        }
        
        Section {
          Text(recommendedBedTime)
        } header: {
          Text("Recommended bedtime")
            .font(.headline)
        }
      }
      .navigationTitle("BetterRest")
    }
  }
}

#Preview {
  ContentView()
}
