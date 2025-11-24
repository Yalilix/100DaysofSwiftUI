//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yanlin Li  on 6/9/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  
  @State private var showingScore = false
  @State private var scoreTitle = ""
  
  @State private var userScore = 0
  @State private var flagInput = ""
  @State private var round = 0
  @State private var showingFinalScore = false
  
  @State private var flagAnimationSpin = 0.0
  @State private var tappedFlag: Int? = nil
  
    var body: some View {
      ZStack {
        RadialGradient(stops: [
            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
        ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
        
        VStack {
          Spacer()
          Text("Guess the Flag")
              .font(.largeTitle.bold())
              .foregroundStyle(.white)

          VStack(spacing: 15) {
            VStack {
              Text("Tap the flag of")
                .foregroundStyle(.secondary)
                .font(.subheadline.weight(.heavy))
              Text(countries[correctAnswer])
//                .foregroundStyle(.white)
                .font(.largeTitle.weight(.semibold))
            }
            
            ForEach(0..<3) { number in
              Button {
                flagTapped(number)
              } label: {
                FlagImage(number: number, countries: countries)
              }
              .rotation3DEffect(number == correctAnswer ? .degrees(flagAnimationSpin) : .degrees(0), axis: (x: 0, y: 1, z: 0))
              .opacity(tappedFlag == nil || tappedFlag == number ? 1.0 : 0.25)
              .animation(.easeOut, value: tappedFlag)
              .scaleEffect(tappedFlag == nil || tappedFlag == number ? 1 : 0.2)
            }
          }
          .frame(maxWidth: .infinity)
          .padding(.vertical, 20)
          .background(.regularMaterial)
          .clipShape(.rect(cornerRadius: 20))
          
          Spacer()
          Spacer()
          Text("Score: \(userScore)")
              .foregroundStyle(.white)
              .font(.title.bold())
          Spacer()
        }
        .padding()
      }
      .alert(scoreTitle, isPresented: $showingScore) {
        Button("Continue", action: askQuestion)
      } message: {
        Text("\(scoreTitle) that is the flag of \(flagInput)")
        Text("Your score is \(userScore)")
      }
    }
  
  func flagTapped(_ number: Int) {
      round += 1
    tappedFlag = number
    
      if round == 8 {
          showingFinalScore = true
          userScore += 1
      } else if number == correctAnswer {
          withAnimation {
            flagAnimationSpin += 360.0
          }
          scoreTitle = "Correct"
          flagInput = countries[number]
          userScore += 1
      } else {
          scoreTitle = "Wrong"
          flagInput = countries[number]
          userScore = 0
      }
    
      showingScore = true
  }
  
  func askQuestion() {
      if round == 8 {
        round = 1
        userScore = 0
      }
      countries.shuffle()
      correctAnswer = Int.random(in: 0...2)
    tappedFlag = nil
  }

}

#Preview {
    ContentView()
}
