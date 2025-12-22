//
//  RemoteImage.swift
//  CupcakeCorner
//
//  Created by Yanlin Li  on 22/12/2025.
//

import SwiftUI

struct RemoteImage: View {
    var body: some View {
      AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
          if let image = phase.image {
              image
                  .resizable()
                  .scaledToFit()
          } else if phase.error != nil {
              Text("There was an error loading the image.")
          } else {
              ProgressView()
          }
      }
      .frame(width: 200, height: 200)
    }
}

#Preview {
    RemoteImage()
}
