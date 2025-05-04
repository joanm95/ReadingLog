//
//  ReadingLogApp.swift
//  ReadingLog
//
//  Created by joan on 5/4/25.
//

import SwiftUI
import SwiftData

@main
struct ReadingLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
