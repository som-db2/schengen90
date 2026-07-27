//
//  RootView.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import SwiftUI
import SwiftData

struct RootView: View {

    @Environment(\.modelContext)
    private var modelContext

    @Environment(AppState.self)
    private var appState

    var body: some View {

        MainTabView()
            .environment(appState)
            .environment(
                TripRepository(
                    modelContext: modelContext
                )
            )

    }

}

#Preview {

    RootView()
        .modelContainer(
            for: Trip.self,
            inMemory: true
        )
        .environment(AppState())

}
