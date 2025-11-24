//
//  Demo.swift
//  Animations
//
//  Created by Yanlin Li  on 14/9/2025.
//

import SwiftUI

struct Demo: View {
  let letters = Array("Hello SwiftUI")
      @State private var enabled = false
      @State private var dragAmount = CGSize.zero

      var body: some View {
          HStack(spacing: 0) {
              ForEach(0..<letters.count, id: \.self) { num in
                  Text(String(letters[num]))
                      .padding(5)
                      .font(.title)
                      .background(enabled ? .blue : .red)
                      .offset(dragAmount)
                      .animation(.linear.delay(Double(num) / 20), value: dragAmount)
              }
          }
          .gesture(
              DragGesture()
                  .onChanged { dragAmount = $0.translation }
                  .onEnded { _ in
                      dragAmount = .zero
                      enabled.toggle()
                  }
          )
      }
}

struct DragGestureWithAnimation: View {
  @State private var dragAmount = CGSize.zero
  
  var body: some View {
    LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
      .frame(width: 300, height: 200)
      .clipShape(.rect(cornerRadius: 10))
      .offset(dragAmount)
      .gesture(
        DragGesture()
          .onChanged { dragAmount = $0.translation }
          .onEnded { _ in
              withAnimation(.bouncy) {
                  dragAmount = .zero
              }
          }
      )
//      .animation(.bouncy, value: dragAmount)
  }
}

struct Animation5_stack_animation: View {
  @State private var animationAmount = 1.0
  @State private var enabled = false
  
  var body: some View {
    Button("Tap Me") {
      enabled.toggle()
    }
    .frame(width: 200, height: 200)
//    .animation(.default, value: enabled)
    .background(enabled ? .blue : .red)
    .animation(nil, value: enabled)
    .foregroundStyle(.white)
    .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
    .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
  }
}

struct Animation4_explicit: View {
  @State private var animationAmount = 1.0
  
  var body: some View {
    Button("Tap Me") {
      withAnimation(.spring(duration: 1, bounce: 0.5)) {
          animationAmount += 360
      }
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 2, y: 1, z: 1))
  }
}

struct Animation1: View {
  var body: some View {
    /// overlay implicit animations
    Button("Tap Me") { }
    .padding(50)
   .background(.red)
   .foregroundStyle(.white)
   .clipShape(.circle)
    .overlay {
      Circle()
        .stroke(.red)
        .scaleEffect(animationAmount)
        .opacity(2 - animationAmount)
        .animation(
          .easeOut(duration: 1)
          .repeatForever(autoreverses: false), value: animationAmount)
    }
    .onAppear {
      animationAmount = 2
    }
  }
  
  @State private var animationAmount: Double
}

struct Animation2: View {
  var body: some View {
    /// normal implicit animations
    Button("Tap Me") {
      animationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(animationAmount)
    .blur(radius: (animationAmount - 1) * 3)
//    .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
//    .animation(.easeInOut(duration: 2)
//      .delay(1), value: animationAmount)
    .animation(.easeInOut(duration: 2)
//      .repeatCount(3, autoreverses: true),
      .repeatForever(autoreverses: true),
               value: animationAmount)
  }
  @State private var animationAmount: Double
}

struct Animation3: View {
  @State private var animationAmount = 1.0
  
  var body: some View {
    /// Binding animations
    print(animationAmount)
    
    return VStack {
      Stepper("Scale amount", value: $animationAmount.animation(
        .easeInOut(duration: 1)
        .repeatCount(3, autoreverses: true)
      ), in: 1...10)
      
      Spacer()
      
      Button("Tap Me") {
        animationAmount += 1
      }
      .padding(40)
      .background(.red)
      .foregroundStyle(.white)
      .clipShape(.circle)
      .scaleEffect(animationAmount)
    }
  }
}

#Preview {
  Demo()
}
