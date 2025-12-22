//
//  ValidDisableForms.swift
//  CupcakeCorner
//
//  Created by Yanlin Li  on 22/12/2025.
//

import SwiftUI

struct ValidDisableForms: View {
  @State private var username = ""
      @State private var email = ""

      var body: some View {
          Form {
              Section {
                  TextField("Username", text: $username)
                  TextField("Email", text: $email)
              }

              Section {
                  Button("Create account") {
                      print("Creating account…")
                  }
              }
              .disabled(username.isEmpty || email.isEmpty)
          }
      }
}

#Preview {
    ValidDisableForms()
}
