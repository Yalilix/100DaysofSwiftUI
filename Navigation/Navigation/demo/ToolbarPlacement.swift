//
//  ToolbarPlacement.swift
//  Navigation
//
//  Created by Yanlin Li  on 15/12/2025.
//

import SwiftUI

struct ToolbarPlacement: View {
    var body: some View {
      NavigationStack {
          Text("Hello, world!")
          .toolbar {
              ToolbarItem(placement: .topBarLeading) {
                  Button("Tap Me") {
                      // button action here
                  }
              }

              ToolbarItem(placement: .topBarLeading) {
                  Button("Or Tap Me") {
                      // button action here
                  }
              }
          }
      }
    }
}

#Preview {
    ToolbarPlacement()
}
