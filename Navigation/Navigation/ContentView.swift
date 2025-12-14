//
//  ContentView.swift
//  Navigation
//
//  Created by Yanlin Li  on 27/11/2025.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
      NavigationStack {
          List(0..<100) { i in
              NavigationLink("Select \(i)", value: i)
          }
          .navigationDestination(for: Int.self) { selection in
              Text("You selected \(selection)")
          }
      }
    }
}

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    ContentView()
}
