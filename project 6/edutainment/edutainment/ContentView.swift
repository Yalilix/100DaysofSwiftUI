//
//  ContentView.swift
//  edutainment
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var playGame = false
  @State var multiplicationChoice = 2
  @State var questionAmount = 5
  
  
    var body: some View {
        VStack {
          if playGame {
            game(multiplicationChoice: $multiplicationChoice, questionAmount: $questionAmount, playGame: $playGame)
          } else {
            home(multiplicationChoice: $multiplicationChoice, questionAmount: $questionAmount, playGame: $playGame)
          }
        }
        .padding()
    }
}


#Preview {
  ContentView()
}
