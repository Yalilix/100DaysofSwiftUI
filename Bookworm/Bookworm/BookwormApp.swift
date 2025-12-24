//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Yanlin Li  on 22/12/2025.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)   
    }
}
