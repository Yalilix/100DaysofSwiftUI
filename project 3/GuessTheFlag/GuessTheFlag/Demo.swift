//
//  Demo.swift
//  GuessTheFlag
//
//  Created by Yanlin Li  on 7/9/2025.
//
//
import SwiftUI

struct Demo: View {
  @State private var showingAlert = false
  
  var body: some View {
    /// 3x3 grid attempt
//    ForEach(Array(0..<3), id: \.self) { _ in
//      HStack() {
//        ForEach(Array(0..<3), id: \.self) { _ in
//          VStack {
//            Text("Hello, World!")
//            Image(systemName: "flag")
//          }
//          .border(Color.red)
//        }
//      }
//      .border(Color.blue)
//    }
    
    // Colors and layout
//    VStack {
//      VStack(spacing: 0) {
//        Color.red
//        Color.blue
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//      }
//      Button {
//          print("Edit button was tapped")
//      } label: {
//          Image(systemName: "pencil")
//      }
//
//      Button {
//          print("Edit button was tapped")
//      } label: {
//          Label("Edit", systemImage: "pencil")
//              .padding()
//              .foregroundStyle(.white)
//              .background(.red)
//      }
//    }
//    .ignoresSafeArea()
    
    Button("Show Alert") {
        showingAlert = true
    }
    .alert("Important message", isPresented: $showingAlert) {
      Button("OK", role: .cancel) { }
    } message: {
        Text("Please read this.")
    }
  }
}

#Preview {
    Demo()
}

