//
//  MainTabView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct MainTabView: View {

    @Environment(AppState.self)
    private var appState

    var body: some View {

        @Bindable var appState = appState

        TabView(selection: $appState.selectedTab) {

            NavigationStack {

                HomeView()

            }
            .tabItem {

                Label(
                    "Home",
                    systemImage: "house"
                )

            }
            .tag(AppState.Tab.dashboard)

            NavigationStack {

                TripsView()

            }
            .tabItem {

                Label(
                    "Trips",
                    systemImage: "airplane"
                )

            }
            .tag(AppState.Tab.trips)

            NavigationStack {

                PlannerView()

            }
            .tabItem {

                Label(
                    "Planner",
                    systemImage: "calendar"
                )

            }
            .tag(AppState.Tab.planner)

            NavigationStack {

                SettingsView()

            }
            .tabItem {

                Label(
                    "Settings",
                    systemImage: "gearshape"
                )

            }
            .tag(AppState.Tab.settings)

        }

    }

}

#Preview {

    MainTabView()
        .environment(AppState())

}
