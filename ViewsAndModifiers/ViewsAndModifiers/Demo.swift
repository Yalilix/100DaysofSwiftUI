//
//  Demo.swift
//  ViewsAndModifiers
//
//  Created by Yanlin Li  on 8/9/2025.
//

import SwiftUI

struct Demo: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

#Preview {
    Demo()
}
