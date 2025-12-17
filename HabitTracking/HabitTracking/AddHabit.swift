//
//  AddHabit.swift
//  HabitTracking
//
//  Created by Yanlin Li  on 16/12/2025.
//

import SwiftUI

struct AddHabit: View {
  @Environment(\.dismiss) var dismiss
  
  @State private var title: String = ""
  @State private var description: String = ""
  
  var habits: Habits
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Title: ", text: $title)
        TextField("Description: ", text: $description)
      }
      .navigationTitle("Add Habit")
      .navigationBarBackButtonHidden()
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            dismiss()
          }
        }
        
        ToolbarItem(placement: .confirmationAction) {
          Button("Add") {
            let habit = HabitItem(title: title, description: description)
            habits.items.append(habit)
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
    AddHabit(habits: Habits())
}
