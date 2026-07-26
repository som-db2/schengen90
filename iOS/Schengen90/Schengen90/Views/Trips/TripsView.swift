//
//  TripsView.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI
import SwiftData

private func previewDate(
    _ year: Int,
    _ month: Int,
    _ day: Int
) -> Date {

    Calendar.current.date(
        from: DateComponents(
            year: year,
            month: month,
            day: day
        )
    )!

}

struct TripsView: View {

    // MARK: - SwiftData

    @Query(
        sort: \Trip.entryDate,
        order: .reverse
    )
    private var trips: [Trip]

    // MARK: - State

    @State
    private var showingAddTrip = false

    // MARK: - Body

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: AppSpacing.large
            ) {

                // MARK: - Header

                HStack {

                    Text("Trips")
                        .font(AppTypography.largeTitle)

                    Spacer()

                    Button {

                        showingAddTrip = true

                    } label: {

                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(AppColors.primary)
                            .padding(8)

                    }

                }

                if !trips.isEmpty {

                    // MARK: - 2026

                    Text("2026")
                        .font(AppTypography.heading)

                    TripCard(
                        entryDate: previewDate(2026, 6, 11),
                        exitDate: previewDate(2026, 7, 16),
                        stayDays: 36,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: previewDate(2026, 5, 5),
                        exitDate: previewDate(2026, 5, 16),
                        stayDays: 12,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: previewDate(2026, 2, 10),
                        exitDate: previewDate(2026, 3, 17),
                        stayDays: 36,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    // MARK: - 2025

                    Text("2025")
                        .font(AppTypography.heading)

                    TripCard(
                        entryDate: previewDate(2025, 12, 26),
                        exitDate: previewDate(2026, 1, 7),
                        stayDays: 13,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: previewDate(2025, 6, 26),
                        exitDate: previewDate(2025, 7, 24),
                        stayDays: 29,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: previewDate(2025, 5, 13),
                        exitDate: previewDate(2025, 5, 20),
                        stayDays: 8,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: previewDate(2025, 2, 4),
                        exitDate: previewDate(2025, 3, 4),
                        stayDays: 29,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    // MARK: - 2024

                    Text("2024")
                        .font(AppTypography.heading)

                    TripCard(
                        entryDate: previewDate(2024, 7, 1),
                        exitDate: previewDate(2024, 7, 15),
                        stayDays: 15,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: previewDate(2024, 5, 6),
                        exitDate: previewDate(2024, 5, 27),
                        stayDays: 22,
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                } else {

                    // MARK: - Empty State

                    CardContainer {

                        VStack(
                            spacing: AppSpacing.medium
                        ) {

                            Image(systemName: "airplane.departure")
                                .font(.system(size: 48))
                                .foregroundStyle(AppColors.primary)

                            Text("No Trips Yet")
                                .font(AppTypography.heading)

                            Text("Add your Schengen trips from the last 180 days to begin calculating your remaining stay.")
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.secondaryText)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 280)

                            PrimaryButton(
                                title: "Add Trip"
                            ) {

                                showingAddTrip = true

                            }

                        }
                        .frame(maxWidth: .infinity)

                    }

                }

            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.xxLarge)
            .padding(.bottom, AppSpacing.large)

        }
        .sheet(isPresented: $showingAddTrip) {

            AddTripView()

        }
        .background(AppColors.background)

    }

}

#Preview {

    TripsView()
        .modelContainer(for: Trip.self, inMemory: true)

}
