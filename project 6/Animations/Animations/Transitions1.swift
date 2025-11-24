//
//  Transitions1.swift
//  Animations
//
//  Created by Yanlin Li  on 24/11/2025.
//

import SwiftUI

struct Transitions1: View {
  @State private var isShowingRed = false
  
  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          isShowingRed.toggle()
        }
      }
      
      if isShowingRed {
        Rectangle()
          .fill(.red)
          .frame(width: 200, height: 200)
//          .transition(.scale)
          .transition(.asymmetric(insertion: .scale, removal: .opacity))
      }
    }
  }
}

#Preview {
    Transitions1()
}
