//
//  MainTabView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct MainTabView: View {

@State
    private var selectedTab = 0
    
    var body: some View {

        TabView(selection: $selectedTab) {

            NavigationStack {

                HomeView()

            }
            .tabItem {

                Label("Home",systemImage: "house")

            }
            .tag(0)

            NavigationStack {

                TripsView()

            }
            .tabItem {

                Label("Trips",systemImage: "airplane"
                )

            }
            .tag(0)

            NavigationStack {

                PlannerView()

            }
            .tabItem {

                Label("Planner",systemImage: "calendar"
                )

            }
            .tag(0)

            NavigationStack {

                SettingsView()

            }
            .tabItem {

                Label("Settings",systemImage: "gearshape"
                )

            }
            .tag(0)

        }

    }

}

#Preview {

    MainTabView()

}
