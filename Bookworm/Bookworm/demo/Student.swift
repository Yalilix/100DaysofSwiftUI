//
//  Student.swift
//  Bookworm
//
//  Created by Yanlin Li  on 22/12/2025.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
