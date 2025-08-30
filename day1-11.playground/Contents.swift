import UIKit

// checkpoint 1 (day 1 - 2)

let temp = 32.0
let fahrenheit = ((temp * 9.0) / 5.0) + 32.0
print("\(fahrenheit)°F is equal to \(temp)°C")

// checkpoint 2 (day 3 - 4)

let check2 = ["a", "b", "c", "d", "d"]

print(check2.count)
print(Set(check2).count)

// checkpoint 3 (day 5 - 6)

for i in 1...100 {
  if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
    "FizzBuzz"
  } else if i.isMultiple(of: 3){
    "Fizz"
  } else if i.isMultiple(of: 5) {
    "Buzz"
  } else {
    "\(i)"
  }
}

// checkpoint 4 (day 7 - 8)

enum inputError: Error {
  case outOfBounds, noRoot
}

func getInput (input: Int) throws -> Int {
  if input < 1 || input > 10_000 {
    throw inputError.outOfBounds
  }
  
  for i in 1...input {
    if i * i == input {
      return i
    }
  }
  
  throw inputError.noRoot
}

do {
  let result = try getInput(input: 9)
  print(result)
} catch inputError.outOfBounds {
  print("out of bounds")
} catch inputError.noRoot {
  print("no root")
}

// checkpoint 5 (day 9 - 10)

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// 1
let result = luckyNumbers.filter { !$0.isMultiple(of: 2) }
// 2cv0
let result2 = result.sorted()
// 3
let result3 = result2.map { "\($0) is a lucky number" }
// 4
result3.forEach { print($0) }

// checkpoint 6 (day 11 - 12)

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

  var vacationRemaining: Int {
      get {
          vacationAllocated - vacationTaken
      }

      set {
          vacationAllocated = vacationTaken + newValue
      }
  }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationAllocated)
archer.vacationRemaining = 5
print(archer.vacationAllocated)

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// test

enum CarError: Error {
  case invalidGear
}

struct Car {
  let model: String
  let numberOfSeats: Int
  private(set) var currentGear: Int
  
  init(model: String, numberOfSeats: Int, currentGear: Int) {
    self.model = model
    self.numberOfSeats = numberOfSeats
    self.currentGear = currentGear
  }
  
  mutating func shiftGearUp() throws {
    if currentGear < 0 || currentGear >= 10 {
      throw CarError.invalidGear
    }
    currentGear += 1
  }
  
  mutating func shiftGearDown() throws{
    if currentGear < 0 || currentGear >= 10 {
      throw CarError.invalidGear
    }
    currentGear -= 1
  }
}

