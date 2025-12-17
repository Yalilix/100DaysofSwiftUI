//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Yanlin Li  on 16/12/2025.
//

import Foundation

struct HabitItem: Identifiable, Codable, Hashable {
  var id: UUID = UUID()
  var title: String
  var description: String
  var completionCount: Int = 0
}
