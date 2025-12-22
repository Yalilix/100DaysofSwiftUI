//
//  Order.swift
//  CupcakeCorner
//
//  Created by Yanlin Li  on 22/12/2025.
//

import Foundation

@Observable
class Order: Codable {
  enum CodingKeys: String, CodingKey {
      case _type = "type"
      case _quantity = "quantity"
      case _specialRequestEnabled = "specialRequestEnabled"
      case _extraFrosting = "extraFrosting"
      case _addSprinkles = "addSprinkles"
      case _name = "name"
      case _city = "city"
      case _streetAddress = "streetAddress"
      case _zip = "zip"
  }
  
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

  var type = 0
  var quantity = 3

  var specialRequestEnabled = false {
      didSet {
          if specialRequestEnabled == false {
              extraFrosting = false
              addSprinkles = false
          }
      }
  }
  var extraFrosting = false
  var addSprinkles = false
  
  var name = "" {
      didSet { saveAddress() }
  }
  var streetAddress = "" {
      didSet { saveAddress() }
  }
  var city = "" {
      didSet { saveAddress() }
  }
  var zip = "" {
      didSet { saveAddress() }
  }
  
  var hasValidAddress: Bool {
    
    if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
      streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
      city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
      zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      return false
    }
    
    return true
  }
  
  var cost: Decimal {
      // $2 per cake
      var cost = Decimal(quantity) * 2

      // complicated cakes cost more
      cost += Decimal(type) / 2

      // $1/cake for extra frosting
      if extraFrosting {
          cost += Decimal(quantity)
      }

      // $0.50/cake for sprinkles
      if addSprinkles {
          cost += Decimal(quantity) / 2
      }

      return cost
  }
  
  private func saveAddress() {
      let address = Address(name: name, streetAddress: streetAddress, city: city, zip: zip)
      if let encoded = try? JSONEncoder().encode(address) {
          UserDefaults.standard.set(encoded, forKey: "SavedAddress")
      }
  }
  
  private func loadAddress() {
    if let data = UserDefaults.standard.data(forKey: "SavedAddress"),
     let address = try? JSONDecoder().decode(Address.self, from: data) {
      name = address.name
      streetAddress = address.streetAddress
      city = address.city
      zip = address.zip
      
      return
    }
    
    name = ""
    streetAddress = ""
    city = ""
    zip = ""
  }
  
  init() {
      loadAddress()
  }
}

struct Address: Codable {
    let name: String
    let streetAddress: String
    let city: String
    let zip: String
}
