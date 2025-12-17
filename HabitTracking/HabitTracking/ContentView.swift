//
//  ContentView.swift
//  HabitTracking
//
//  Created by Yanlin Li  on 15/12/2025.
//

import SwiftUI

@Observable
class Habits {
  init() {
    if let data = UserDefaults.standard.data(forKey: "habits") {
      if let decodedData = try? JSONDecoder().decode([HabitItem].self, from: data) {
        items = decodedData
        return
      }
    }
    
    items = []
  }
  
  var items = [HabitItem]() {
    didSet {
      if let encoded = try? JSONEncoder().encode(items) {
        UserDefaults.standard.set(encoded, forKey: "habits")
      }
    }
  }
}

struct ContentView: View {
  @State private var habits = Habits()
  
  var body: some View {
    NavigationStack {
      List {
        Section("Habit") {
          ForEach(Array(habits.items.enumerated()), id: \.element.id) { index, item in
            NavigationLink(value: index) {
              VStack {
                Text(item.title)
                  .font(.headline)
                Text(item.description)
                  .font(.caption)
              }
            }
          }
        }
      }
      .navigationTitle("Habit Tracker")
      .toolbar {
        NavigationLink {
          AddHabit(habits: habits)
        } label: {
          Label("Add Habit", systemImage: "plus")
        }
      }
      .navigationDestination(for: Int.self) { index in  // Receive the INDEX
        HabitDetailsView(habitIndex: index, habits: habits)
      }
    }
  }
}

#Preview {
    ContentView()
}
