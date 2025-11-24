//
//  game.swift
//  edutainment
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct game: View {
    @Binding var multiplicationChoice: Int
    @Binding var questionAmount: Int
    @Binding var playGame: Bool
    
    @State private var questionBank: [Question] = []
    @State private var completionCount = 0
    @State private var choiceInString = ""
    
    private var choice: Int {
        Int(choiceInString) ?? 0
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                
              if completionCount < questionBank.count {
                  Text(questionBank[completionCount].text)
              } else {
                  Text("You're done! 🎉")
              }
                
                TextField("Answer", text: $choiceInString)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Spacer()
            }

            Button("Submit") {
                if choice == questionBank[completionCount].answer {
                    completionCount += 1
                    choiceInString = ""
                  if completionCount == questionAmount {
                    playGame.toggle()
                    completionCount = 0
                  }
                }
            }
        }
        .onAppear {
            generateQuestions()
        }
    }
    
    func generateQuestions() {
        questionBank = []
        for _ in 0..<questionAmount {
            let lhs = Int.random(in: 1...multiplicationChoice)
            let rhs = Int.random(in: 1...multiplicationChoice)
            questionBank.append(Question(
                text: "\(lhs) * \(rhs)",
                answer: lhs * rhs
            ))
        }
    }
}


#Preview {
  game(multiplicationChoice: .constant(8), questionAmount: .constant(5), playGame: .constant(false))
}
