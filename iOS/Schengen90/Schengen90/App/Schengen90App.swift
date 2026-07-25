//
//  Schengen90App.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI
import SwiftData

@main
struct Schengen90App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(
            for: Trip.self
        )
    }
}
