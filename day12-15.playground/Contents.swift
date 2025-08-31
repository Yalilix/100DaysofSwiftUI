// checkpoint 7 (day 12)

class Animal {
  let legs: Int
  
  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  init() {
    super.init(legs: 4)
  }
  
  func speak() -> String {
    "woof"
  }
}

class Cat: Animal {
  var isTame: Bool
  
  init(isTame: Bool) {
    self.isTame = isTame
    super.init(legs: 4)
  }
  
  func speak() -> String {
    "meow"
  }
}

class Poodle: Dog {
  
}

class Corgi: Dog {
  
}

class Persian: Cat {
  override init(isTame: Bool) {
    super.init(isTame: isTame)
  }
}

class Lion: Cat {
  override init(isTame: Bool) {
    super.init(isTame: isTame)
  }
}

// checkpoint 8 (day 13)

protocol Building {
  var numberOfRooms: Int { get }
  var cost: Int { get set }
  var realEstateAgent: String { get set }
  
  func salesSummary() -> String
}

struct House: Building {
  var cost: Int = 500_000
  
  var realEstateAgent: String = "John"
  
  var numberOfRooms: Int = 4
  
  func salesSummary() -> String {
    "This \(Self.self) cost \(cost), which has \(numberOfRooms) rooms."
  }
}

struct Office: Building {
  var numberOfRooms: Int = 10
  
  var cost: Int = 1_000_000_000
  
  var realEstateAgent: String = "Alex"
  
  func salesSummary() -> String {
    "This \(Self.self) cost \(cost), which has \(numberOfRooms) rooms."
  }
}

// checkpoint 9 (day 14)

func getRandomElementFromArray(arr: [Int]?) -> Int { arr?.randomElement() ?? .random(in: 1...100) }
