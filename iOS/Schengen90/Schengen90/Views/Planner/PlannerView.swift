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
    
    @State
    private var showPlannedTripLimitAlert = false

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
                            in: Calendar.current.startOfDay(for: Date())...,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()

                    }

                    // MARK: - Trip Summary

                    SectionHeader(
                        title: "Trip Summary"
                    )

                    VStack(
                        spacing: AppSpacing.medium
                    ) {

                        InfoCard(
                            title: "Maximum Stay",
                            value:
                                viewModel.result
                                .map {
                                    "\($0.simulatedDays) Days"
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

                        guard let trip = repository.addPlannedTrip(
                            entryDate: viewModel.plannedEntry,
                            latestLegalExit: latestLegalExit
                        ) else {

                            showPlannedTripLimitAlert = true
                            return

                        }

                        appState.selectedTrip = trip
                        appState.selectedTab = .trips

                        showEntryPicker = false

                    }

                }
                .padding(.horizontal, AppSpacing.screen)
                .padding(.top, AppSpacing.xLarge)
                .padding(.bottom, AppSpacing.large)

            }
            .onAppear {

                viewModel.calculate(
                    existingTrips: existingTrips.filter { !$0.isPlanned }
                )
                
            }
            .onChange(of: viewModel.plannedEntry) {

                viewModel.calculate(
                    existingTrips: existingTrips.filter { !$0.isPlanned }
                )
            }
            
            .alert(
                "Maximum Planned Trips",
                isPresented: $showPlannedTripLimitAlert
            ) {

                Button("OK", role: .cancel) { }

            } message: {

                Text(
                    "You can only keep two planned trips at a time. Delete or complete an existing planned trip before creating another."
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
