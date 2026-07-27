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

    @State
    private var appState = AppState()

    var body: some Scene {

        WindowGroup {

            MainTabView()
                .environment(appState)

        }
        .modelContainer(for: Trip.self)

    }

}
