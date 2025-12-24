//
//  TextEditorForMultiText.swift
//  Bookworm
//
//  Created by Yanlin Li  on 22/12/2025.
//

import SwiftUI

struct TextEditorForMultiText: View {
  @AppStorage("notes") private var notes = ""

  var body: some View {
    NavigationStack {
//      TextEditor(text: $notes)
//        .navigationTitle("Notes")
//        .padding()
      
      TextField("Enter your text", text: $notes, axis: .vertical)
                      .textFieldStyle(.roundedBorder)
                      .navigationTitle("Notes")
                      .padding()
    }
  }
}

#Preview {
    TextEditorForMultiText()
}
