//
//  CodableToObservableClass.swift
//  CupcakeCorner
//
//  Created by Yanlin Li  on 22/12/2025.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }

    var name = "Taylor"
}

struct CodableToObservableClass: View {
  var body: some View {
      Button("Encode Taylor", action: encodeTaylor)
  }

  func encodeTaylor() {
      let data = try! JSONEncoder().encode(User())
      let str = String(decoding: data, as: UTF8.self)
      print(str)
  }
}

#Preview {
    CodableToObservableClass()
}
