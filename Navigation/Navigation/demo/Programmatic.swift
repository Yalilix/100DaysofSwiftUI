//
//  Programmatic.swift
//  Navigation
//
//  Created by Yanlin Li  on 14/12/2025.
//

import SwiftUI

struct Programmatic: View {
  @State private var path = [Int]()
  
    var body: some View {
      NavigationStack(path: $path) {
        VStack {
          Button("Show 32") {
              path = [32]
          }

          Button("Show 64") {
              path.append(64)
          }
        }
        .navigationDestination(for: Int.self) { selection in
          Text("You selected \(selection)")
        }
      }
    }
}

#Preview {
    Programmatic()
}
