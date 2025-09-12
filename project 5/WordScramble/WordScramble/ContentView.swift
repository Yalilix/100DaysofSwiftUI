//
//  ContentView.swift
//  WordScramble
//
//  Created by Yanlin Li  on 11/9/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var usedWords = [String]()
  @State private var rootWord = ""
  @State private var newWord = ""
  
  // Error message stuff
  @State private var errorTitle = ""
  @State private var errorMessage = ""
  @State private var showingError = false
  
  @State private var points = 0
  
    var body: some View {
      NavigationStack {
        List {
          Section {
            TextField("Enter your word", text: $newWord)
              .textInputAutocapitalization(.never)
          }
          
          Section {
            ForEach(usedWords, id: \.self) { word in
              HStack {
                Image(systemName: "\(word.count).circle")
                Text(word)
              }
            }
          }
          
          Section {
            Text("Score: \(points)")
          }
        }
        .navigationTitle(rootWord)
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showingError) { } message: {
          Text(errorMessage)
        }
        .toolbar {
          Button("Restart") {
            startGame()
          }
        }
      }
    }

  func addNewWord() {
    // lowercase and trim the word, to make sure we don't add duplicate words with case differences
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    
    // exit if the remaining string is empty
    guard answer.count > 0 else {
      return
    }
    
    guard isOrginal(word: answer) else {
      wordError(title: "Word used already", message: "Be more original")
      return
    }
    
    guard isPossible(word: answer) else {
      wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
      return
    }

    guard isInRange(word: answer) else {
      wordError(title: "Word too short or the same as the root word", message: "try a longer word or any word but the root word!")
      return
    }
    
    guard isReal(word: answer) else {
      wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
      return
    }
    
    withAnimation {
      usedWords.insert(answer, at: 0)
    }
    
    points += answer.count
    
    newWord = ""
  }
  
  func startGame() {
    usedWords = []
    newWord = ""
    // 1. Find the URL for start.txt in our app bundle
    if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
      // 2. Load start.txt into a string
      if let startWords = try? String(contentsOf: startWordURL) {
        // 3. Split the string up into an array of strings, splitting on line breaks
        let allWords = startWords.components(separatedBy: "\n")
        
        // 4. Pick one random word, or use "silkworm" as a sensible default
        rootWord = allWords.randomElement() ?? "silkworm"
        
        // If we are here everything has worked, so we can exit
        return
      }
    }
    
    // If were are *here* then there was a problem – trigger a crash and report the error
    fatalError("Could not load start.txt from bundle.")
  }
  
  func isOrginal(word: String) -> Bool {
    !usedWords.contains(word)
  }
  
  func isPossible(word: String) -> Bool {
    var tempWord = rootWord
    
    for letter in word {
      if let pos = tempWord.firstIndex(of: letter) {
          tempWord.remove(at: pos)
      } else {
        return false
      }
    }
    
    return true
  }
  
  func isReal(word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    
    return misspelledRange.location == NSNotFound
  }
  
  func wordError(title: String, message: String) {
    errorTitle = title
    errorMessage = message
    showingError = true
  }
  
  func isInRange(word: String) -> Bool {
    !(word.count < 3 || word == rootWord)
  }
}

#Preview {
    ContentView()
}
