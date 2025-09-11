//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Yanlin Li  on 9/9/2025.
//

import SwiftUI

struct ContentView: View {
  @State var actions: [String] = ["Rock", "Paper", "Scissor"]
  @State var selectedAction: Int = Int.random(in: 0...2)
  
  @State var decision: Bool = Bool.random()
  @State var decisions: [String] = ["Win", "Lose"]
  
  @State var points: Int = 0
  @State var haveWon: Bool = false
  
  var body: some View {
      VStack {
        Spacer()
        // App Choice
        Text("App's Choice")
        
        HStack {
          Text("\(actions[selectedAction])")

          Text("- \(decision ? "Win" : "Lose")")
        }
        .font(.largeTitle)
        .bold()
        .foregroundStyle(.mint)
        
        Spacer()
        
        // User Choice
        Text("User's Choice")
        HStack {
          ForEach(0..<3) { number in
            Button {
              actionTapped(number)
            } label: {
              Text("\(actions[number])")
            }
            .padding(15)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
          }
        }
        .alert("You Won After 10 Rounds!", isPresented: $haveWon) {
          Button("Try Again", action: resetGame)
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.green)
        } message: {
          Text("Final Score: \(points)")
        }
        
        Spacer()
        Text("Score: \(points)")
          .font(.largeTitle)
        Spacer()
      }
      .padding()

  }
  
  func playGame () {
    decision.toggle()
    selectedAction = Int.random(in: 0...2)
  }
  
  func actionTapped (_ number: Int) {
    if decision && number == ((selectedAction + 1) % 3) {
      points += 1
    } else if !decision && number != ((selectedAction + 1) % 3) {
      points += 1
    } else {
      if points != 0 {
        points -= 1
      }
    }
    
    if points == 10 {
      haveWon = true
    } else {
      playGame()
    }
  }
  
  func resetGame () {
    points = 0
    playGame()
  }
}

#Preview {
    ContentView()
}
