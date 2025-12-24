//
//  Book.swift
//  Bookworm
//
//  Created by Yanlin Li  on 22/12/2025.
//

import Foundation
import SwiftData

@Model
class Book {
  init(title: String, author: String, genre: String, review: String, rating: Int) {
    self.title = title
    self.author = author
    self.genre = genre
    self.review = review
    self.rating = rating
    self.date = Date.now
  }
  
  var title: String
  var author: String
  var genre: String
  var review: String
  var rating: Int
  var date: Date
}
