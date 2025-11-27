//
//  Content.swift
//  Moonshot
//
//  Created by Yanlin Li  on 26/11/2025.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct Content4: View {
    var body: some View {
      Button("Decode JSON") {
        let input = """
        {
            "name": "Taylor Swift",
            "address": {
                "street": "555, Taylor Swift Avenue",
                "city": "Nashville"
            }
        }
        """

        // more code to come
        let data = Data(input.utf8)
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: data) {
            print(user.address.street)
        }
      }
    }
}

struct Content3: View {
    var body: some View {
      NavigationStack {
        List(0..<100) { row in
            NavigationLink("Row \(row)") {
                Text("Detail \(row)")
            }
        }
        .navigationTitle("SwiftUI")
      }
    }
}

struct Content: View {
    var body: some View {
      Image(.example)
        .resizable()
        .scaledToFit()
        .containerRelativeFrame(.horizontal) { size, axis in
          size * 0.8
        }
    }
}

struct Content2: View {
    var body: some View {
      ScrollView {
          LazyVStack(spacing: 10) {
              ForEach(0..<100) {
                CustomText("Item \($0)")
                      .font(.title)
              }
          }
          .frame(maxWidth: .infinity)
      }
    }
}

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}


#Preview {
    Content3()
}
