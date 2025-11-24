//
//  home.swift
//  edutainment
//
//  Created by Yanlin Li  on 25/11/2025.
//

import SwiftUI

struct home: View {
  @Binding var multiplicationChoice: Int
  @Binding var questionAmount: Int
  @Binding var playGame: Bool
  
  var body: some View {
    VStack(spacing: 20) {
      Section("Which multiplication table?") {
        Stepper("Multiplication tables up to: \(multiplicationChoice)", value: $multiplicationChoice, in: 2...12)
      }
      
      Divider()
      
      Section("Question Amount") {
        HStack {
          ForEach(1..<4) {
            let amount = $0 * 5
            Button("\(amount)") {
              selectQuestionAmount(selection: amount)
            }
            .frame(width: 100, height: 100)
            .background(.red)
            .font(.title)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 15))
          }
        }
      }
      Divider()

      Button("Submit") {
        accept()
      }
    }
    .padding(.horizontal, 15)
  }
  
  
  private func selectQuestionAmount(selection: Int) {
    questionAmount = selection
  }
  
  private func accept() {
    playGame.toggle()
  }
}

#Preview {
  home(multiplicationChoice: .constant(2), questionAmount: .constant(5), playGame: .constant(false))
}
