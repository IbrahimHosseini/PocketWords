//
//  PocketWordsApp.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import SwiftUI
import SwiftData

@main
struct PocketWordsApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([
            WordCard.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema , isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            FlashcardView(context: modelContainer.mainContext)
        }
        .modelContext(modelContainer.mainContext)
    }
}
