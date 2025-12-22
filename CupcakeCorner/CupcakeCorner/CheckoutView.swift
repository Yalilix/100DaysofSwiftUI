//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Yanlin Li  on 22/12/2025.
//

import SwiftUI

struct CheckoutView: View {
  @State private var confirmationMessage = ""
  @State private var showingConfirmation = false
  @State private var errorPresented = false
  @State private var errorMessage = ""
  
  var order: Order

  var body: some View {
    ScrollView {
      VStack {
        AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(height: 233)
        
        Text("Your total is \(order.cost, format: .currency(code: "USD"))")
            .font(.title)

        Button("Place Order") {
            Task {
                await placeOrder()
            }
        }
        .padding()
      }
    }
    .navigationTitle("Check out")
    .navigationBarTitleDisplayMode(.inline)
    .scrollBounceBehavior(.basedOnSize)
    .alert("Thank you!", isPresented: $showingConfirmation) {
      Button("OK") { }
    } message: {
      Text(confirmationMessage)
    }
    .alert("Error", isPresented: $errorPresented) {
      Button("OK") { }
    } message: {
      Text(errorMessage)
    }
  }
  
  func placeOrder() async {
      guard let encoded = try? JSONEncoder().encode(order) else {
          print("Failed to encode order")
          return
      }
      
      let url = URL(string: "https://httpbin.org/post")!
      var request = URLRequest(url: url)
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//      request.httpMethod = "POST"
      
      do {
        let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        // httpbin echoes back your data in a "json" field
        let response = try JSONDecoder().decode(HTTPBinResponse.self, from: data)
        confirmationMessage = "Your order for \(response.json.quantity)x \(Order.types[response.json.type].lowercased()) cupcakes is on its way!"
        showingConfirmation = true
      } catch {
        errorMessage = "Checkout failed: \(error.localizedDescription)"
        errorPresented = true
        print("Checkout failed: \(error.localizedDescription)")
      }
  }

  // Add this struct to decode httpbin's response
  struct HTTPBinResponse: Codable {
      let json: Order
  }
}

#Preview {
    CheckoutView(order: Order())
}
