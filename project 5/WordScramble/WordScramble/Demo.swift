//
//  Demo.swift
//  WordScramble
//
//  Created by Yanlin Li  on 11/9/2025.
//

import SwiftUI

struct Demo: View {
  var body: some View {
    List {
      Section("Section 1") {
        Text("Static row 1")
        Text("Static row 2")
      }

      Section("Section 2") {
        ForEach(0..<5) {
          Text("Dynamic row \($0)")
        }
      }

      Section("Section 3") {
        Text("Static row 3")
        Text("Static row 4")
      }
    }
    .listStyle(.grouped)
  }
}

#Preview {
  Demo()
}
