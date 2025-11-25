//
//  UserDefaultsView.swift
//  iExpense
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct UserDefaultsView: View {
  @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

  var body: some View {
      Button("Tap count: \(tapCount)") {
          tapCount += 1
          UserDefaults.standard.set(tapCount, forKey: "Tap")
      }
  }
}

struct UserDefaultsView2: View {
  @AppStorage("tapCount") private var tapCount = 0

  var body: some View {
      Button("Tap count: \(tapCount)") {
          tapCount += 1
      }
  }
}

#Preview {
    UserDefaultsView()
}
