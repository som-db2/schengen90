//
//  SettingsView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: AppSpacing.large
                ) {

                    // MARK: - General

                    SectionHeader(title: "General")

                    VStack(spacing: AppSpacing.medium) {

                        SettingsRow(
                            title: "Calculation Rules",
                            icon: "function"
                        ) {

                        }

                        SettingsRow(
                            title: "Date Format",
                            icon: "calendar"
                        ) {

                        }

                    }

                    // MARK: - Data

                    SectionHeader(title: "Data")

                    VStack(spacing: AppSpacing.medium) {

                        SettingsRow(
                            title: "Export Trips",
                            icon: "square.and.arrow.up"
                        ) {

                        }

                        SettingsRow(
                            title: "Import Trips",
                            icon: "square.and.arrow.down"
                        ) {

                        }

                        SettingsRow(
                            title: "Reset All Trips",
                            icon: "trash",
                            isDestructive: true
                        ) {

                        }

                    }

                    // MARK: - About

                    SectionHeader(title: "About")

                    VStack(spacing: AppSpacing.medium) {

                        SettingsRow(
                            title: "Privacy Policy",
                            icon: "hand.raised"
                        ) {

                        }

                        SettingsRow(
                            title: "App Version",
                            icon: "info.circle",
                            value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-"
                        )

                    }

                }
                .padding(20)

            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)

        }

    }

}

#Preview {

    SettingsView()

}
