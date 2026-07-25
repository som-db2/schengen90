//
//  PlannerView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct PlannerView: View {

    // MARK: - Demo Data

    @State private var plannedEntry = "10 Sep 2026"
    @State private var plannedExit = "22 Sep 2026"

    private let tripDuration = "13 Days"
    private let remainingDays = "65 Days"
    private let latestLegalExit = "22 Sep 2026"

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: AppSpacing.large
                ) {

                    // MARK: - Date Selection

                    DateField(
                        title: "Planned Entry",
                        date: plannedEntry
                    ) {

                        // Open Entry DatePicker (Later)

                    }

                    DateField(
                        title: "Planned Exit",
                        date: plannedExit
                    ) {

                        // Open Exit DatePicker (Later)

                    }

                    // MARK: - Trip Summary

                    SectionHeader(
                        title: "Trip Summary"
                    )

                    VStack(
                        spacing: AppSpacing.medium
                    ) {

                        InfoCard(
                            title: "Trip Duration",
                            value: tripDuration
                        )

                        InfoCard(
                            title: "Remaining After Trip",
                            value: remainingDays
                        )

                        InfoCard(
                            title: "Latest Legal Exit",
                            value: latestLegalExit
                        )

                    }

                    // MARK: - Status

                    HStack {

                        Spacer()

                        StatusBadge(
                            title: "Safe",
                            color: AppColors.success
                        )

                        Spacer()

                    }

                    // MARK: - Calculate Button

                    PrimaryButton(
                        title: "Calculate"
                    ) {

                        // Calculation Engine Later

                    }

                }
                .padding(AppSpacing.screen)

            }
            .navigationTitle("Planner")
            .navigationBarTitleDisplayMode(.large)

        }

    }

}

#Preview {

    PlannerView()

}
