//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Yanlin Li  on 8/9/2025.
//

import SwiftUI

struct FlagImage: View {
  let number: Int
  let countries: [String]
  
  var body: some View {
    Image(countries[number])
      .clipShape(.capsule)
      .shadow(radius: 5)
  }
}

#Preview {
  FlagImage(number: 0, countries: ["France"])
}
