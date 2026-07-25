//
//  MainTabView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {

        TabView {

            NavigationStack {

                HomeView()

            }
            .tabItem {

                Label(
                    "Home",
                    systemImage: "house"
                )

            }

            NavigationStack {

                TripsView()

            }
            .tabItem {

                Label(
                    "Trips",
                    systemImage: "airplane"
                )

            }

            NavigationStack {

                PlannerView()

            }
            .tabItem {

                Label(
                    "Planner",
                    systemImage: "calendar"
                )

            }

            NavigationStack {

                SettingsView()

            }
            .tabItem {

                Label(
                    "Settings",
                    systemImage: "gearshape"
                )

            }

        }

    }

}

#Preview {

    MainTabView()

}
