//
//  PlannerView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI
import SwiftData

struct PlannerView: View {

    @Environment(TripRepository.self)
    private var repository

    @Environment(AppState.self)
    private var appState

    @State
    private var viewModel = PlannerViewModel()

    @State
    private var showEntryPicker = false

    @Query(
        sort: \Trip.entryDate,
        order: .forward
    )
    private var existingTrips: [Trip]

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

                    if showEntryPicker {

                        DatePicker(
                            "",
                            selection: $viewModel.plannedEntry,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()

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

                    // MARK: - Plan Trip

                    PrimaryButton(
                        title: "Plan This Trip"
                    ) {

                        guard
                            let result = viewModel.result,
                            let latestLegalExit = result.latestLegalExit
                        else {

                            return

                        }

                        let plannedTripCount = existingTrips.filter(\.isPlanned).count

                        guard plannedTripCount < 2 else {

                            return

                        }

                        let trip = repository.addPlannedTrip(
                            entryDate: viewModel.plannedEntry,
                            latestLegalExit: latestLegalExit
                        )
                        
                        appState.selectedTrip = trip
                        appState.selectedTab = .trips

                        showEntryPicker = false

                    }

                }
                .padding(AppSpacing.screen)

            }
            .onAppear {

                viewModel.calculate(
                    existingTrips: existingTrips
                )

            }
            .onChange(of: viewModel.plannedEntry) {

                viewModel.calculate(
                    existingTrips: existingTrips
                )

            }
            .navigationTitle("Planner")
            .navigationBarTitleDisplayMode(.large)

        }

    }

}

#Preview {

    PlannerView()
        .environment(AppState())
        .environment(
            TripRepository(
                modelContext: try! ModelContainer(
                    for: Trip.self,
                    configurations: ModelConfiguration(
                        isStoredInMemoryOnly: true
                    )
                ).mainContext
            )
        )

}
