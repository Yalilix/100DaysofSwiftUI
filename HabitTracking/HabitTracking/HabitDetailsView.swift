//
//  HabitDetailsView.swift
//  HabitTracking
//
//  Created by Yanlin Li  on 16/12/2025.
//

import SwiftUI

struct HabitDetailsView: View {
  @Environment(\.dismiss) var dismiss
  var habitIndex: Int
  var habits: Habits
  
  private var habit: HabitItem {
    habits.items[habitIndex]
  }

  var body: some View {
    VStack(spacing: 16) {
      Text("Activity: \(habit.title)")
        .font(.title)
      
      Divider()
      
      Text("Completed: \(habit.completionCount) times")
        .font(.title)
        .padding()
      
      Button("Increment activity completion") {
        habits.items[habitIndex].completionCount += 1
      }
    }
    .padding()
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Cancel") {
          dismiss()
        }
      }
      
      ToolbarItem(placement: .confirmationAction) {
        Button("Done") {
          dismiss()
        }
      }
    }
  }
}

#Preview {
  HabitDetailsView(habitIndex: 0, habits: Habits())
}
