//
//  NavTitleEditable.swift
//  Navigation
//
//  Created by Yanlin Li  on 15/12/2025.
//

import SwiftUI

struct NavTitleEditable: View {
  @State private var title = "SwiftUI"

     var body: some View {
         NavigationStack {
             Text("Hello, world!")
                 .navigationTitle($title)
                 .navigationBarTitleDisplayMode(.inline)
         }
     }
}

#Preview {
    NavTitleEditable()
}
