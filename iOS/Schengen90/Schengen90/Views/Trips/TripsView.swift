//
//  TripsView.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

//
//  TripsView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct TripsView: View {

    // MARK: - Temporary Demo State
    // Later this will become:
    // if trips.isEmpty { ... }

    private let hasTrips = false

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

                    } label: {

                        Image(systemName: "plus")
                            .font(.title2)
                            .padding(8)

                    }

                }

                if hasTrips {

                    // MARK: - 2026

                    Text("2026")
                        .font(AppTypography.heading)

                    TripCard(
                        entryDate: "11 Jun 2026",
                        exitDate: "16 Jul 2026",
                        duration: "Duration: 36 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    TripCard(
                        entryDate: "05 May 2026",
                        exitDate: "16 May 2026",
                        duration: "Duration: 12 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )
                    
                    TripCard(
                        entryDate: "10 Feb 2026",
                        exitDate: "17 Mar 2026",
                        duration: "Duration: 36 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    // MARK: - 2025

                    Text("2025")
                        .font(AppTypography.heading)

                    TripCard(
                        entryDate: "26 Dec 2025",
                        exitDate: "07 Jan 2026",
                        duration: "Duration: 13 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )
                    
                    TripCard(
                        entryDate: "26 June 2025",
                        exitDate: "24 July 2026",
                        duration: "Duration: 29 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )
                    
                    TripCard(
                        entryDate: "13 May 2025",
                        exitDate: "20 May 2025",
                        duration: "Duration: 8 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )
                    
                    TripCard(
                        entryDate: "04 Feb 2025",
                        exitDate: "04 Mar 2025",
                        duration: "Duration: 29 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )

                    // MARK: - 2024

                    Text("2024")
                        .font(AppTypography.heading)

                    TripCard(
                        entryDate: "01 Jul 2024",
                        exitDate: "15 Jul 2024",
                        duration: "Duration: 15 days",
                        status: "Completed",
                        statusColor: AppColors.success
                    )
                    
                    TripCard(
                        entryDate: "06 May 2024",
                        exitDate: "27 May 2024",
                        duration: "Duration: 22 days",
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

                            Text("Add your first Schengen trip to start calculating your remaining days.")
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.secondaryText)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 280)

                            PrimaryButton(
                                title: "Add Trip"
                            ) {

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
        .background(AppColors.background)

    }

}

#Preview {
    TripsView()
}
