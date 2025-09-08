//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yanlin Li  on 7/9/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          Color.blue
              .frame(width: 300, height: 200)
              .watermarked(with: "Hacking with Swift")
        }
        .padding()
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomProminentTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundStyle(.blue)
  }
}

extension View {
  func prominentTitle() -> some View {
    modifier(CustomProminentTitle())
  }
}

#Preview {
  ContentView()
}
