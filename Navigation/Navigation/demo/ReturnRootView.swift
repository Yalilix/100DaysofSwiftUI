//
//  ReturnRootView.swift
//  Navigation
//
//  Created by Yanlin Li  on 14/12/2025.
//

import SwiftUI

struct ReturnRootView: View {
  @State private var pathStore = PathStore()

      var body: some View {
        NavigationStack(path: $pathStore.path) {
              DetailView2(number: 0)
                  .navigationDestination(for: Int.self) { i in
                      DetailView2(number: i)
                  }
          }
      }
}

struct DetailView2: View {
    var number: Int
//  @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
//            .toolbar {
//                Button("Home") {
//                  path = NavigationPath()
//                }
//            }
    }
}

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

#Preview {
    ReturnRootView()
}
