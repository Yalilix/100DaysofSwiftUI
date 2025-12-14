//
//  CustomNavBar.swift
//  Navigation
//
//  Created by Yanlin Li  on 15/12/2025.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
      NavigationStack {
          List(0..<100) { i in
              Text("Row \(i)")
          }
          .navigationTitle("Title goes here")
          .navigationBarTitleDisplayMode(.inline)
          .toolbarBackground(.blue)
          .toolbarColorScheme(.dark)
          .toolbar(.hidden, for: .navigationBar)
      }
    }
}

#Preview {
    CustomNavBar()
}
