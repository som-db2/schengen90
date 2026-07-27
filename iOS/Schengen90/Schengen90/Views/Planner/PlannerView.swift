//
//  PlannerView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct PlannerView: View {

    @State private var viewModel = PlannerViewModel()
    
    @State private var showEntryPicker = false

    // Demo data until Trips are connected
    private let existingTrips: [Trip] = []

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
                        date: DateFormatter.displayDate.string(
                            from: viewModel.plannedEntry
                        )
                    ) {

                        showEntryPicker = true

                    }

                    DateField(
                        title: "Planned Exit",
                        date:
                            viewModel.result?.latestLegalExit
                            .map {
                                DateFormatter.displayDate.string(
                                    from: $0
                                )
                            }
                            ?? "-"
                    ) {

                        // Date Picker later

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
                            value:
                                viewModel.result
                                .map {
                                    "\($0.simulatedDays) Days"
                                }
                                ?? "-"
                        )

                        InfoCard(
                            title: "Remaining After Trip",
                            value:
                                viewModel.result
                                .map {
                                    "\($0.finalStatus.remainingDays) Days"
                                }
                                ?? "-"
                        )

                        InfoCard(
                            title: "Latest Legal Exit",
                            value:
                                viewModel.result?.latestLegalExit
                                .map {
                                    DateFormatter.displayDate.string(
                                        from: $0
                                    )
                                }
                                ?? "-"
                        )

                    }

                    // MARK: - Status

                    HStack {

                        Spacer()

                        StatusBadge(
                            title:
                                viewModel.result?.finalStatus.isCompliant == true
                                ? "Safe"
                                : "Not Safe",
                            color:
                                viewModel.result?.finalStatus.isCompliant == true
                                ? AppColors.success
                                : AppColors.error
                        )

                        Spacer()

                    }

                    // MARK: - Calculate

                    PrimaryButton(
                        title: "Calculate"
                    ) {

                        viewModel.calculate(
                            existingTrips: existingTrips
                        )

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
