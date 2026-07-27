//
//  HomeView.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {

    // MARK: - Temporary Demo Data
    // These will later come from HomeViewModel

    @Query
    private var trips: [Trip]

    @State
    private var viewModel = HomeViewModel()

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: AppSpacing.large
            ) {

                // MARK: - Header

                Text("Schengen90")
                    .font(AppTypography.largeTitle)

                VStack(
                    alignment: .leading,
                    spacing: AppSpacing.xSmall
                ) {

                    Text(GreetingHelper.greeting())
                        .font(AppTypography.body)
                        .foregroundStyle(AppColors.secondaryText)

                    Text("Plan your next Schengen journey")
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.secondaryText)

                }

                // MARK: - Remaining Days

                CardContainer {

                    Text("Remaining Days")
                        .font(AppTypography.heading)

                    Text("\(viewModel.remainingDays)")
                        .font(AppTypography.hero)
                        .frame(maxWidth: .infinity)

                    Text("Days Remaining")
                        .font(AppTypography.body)
                        .frame(maxWidth: .infinity)

                }

                // MARK: - Latest Legal Exit

                CardContainer {

                    Text("Latest Legal Exit")
                        .font(AppTypography.heading)

                    Text(viewModel.latestLegalExit)
                        .font(AppTypography.title)
                        .frame(maxWidth: .infinity)

                    Spacer()
                        .frame(height: AppSpacing.small)

                    StatusBadge(
                        title: viewModel.tripStatus,
                        color: AppColors.success
                    )

                }
                
                // MARK: - Next Planned Trip

                SectionHeader(title: "Next Planned Trip")

                CardContainer {

                    if let trip = viewModel.nextPlannedTrip {

                        VStack(
                            alignment: .leading,
                            spacing: AppSpacing.small
                        ) {

                            Text(
                                "\(DateFormatter.tripDate.string(from: trip.entryDate)) → \(DateFormatter.tripDate.string(from: trip.exitDate))"
                            )
                            .font(AppTypography.bodyBold)

                            Text(
                                "\(trip.stayDays) day\(trip.stayDays == 1 ? "" : "s")"
                            )
                            .font(AppTypography.caption)
                            .foregroundStyle(AppColors.secondaryText)

                        }

                    } else {

                        VStack(
                            alignment: .leading,
                            spacing: AppSpacing.small
                        ) {

                            Text("No planned trips")
                                .font(AppTypography.bodyBold)

                            Text("Use Planner to create your next trip.")
                                .font(AppTypography.caption)
                                .foregroundStyle(AppColors.secondaryText)

                        }

                    }

                }

                // MARK: - Add Trip Button

                PrimaryButton(title: "Add Trip") {

                }

                // MARK: - Recent Trips

                SectionHeader(title: "Recent Trips")

                if viewModel.recentTrips.isEmpty {

                    CardContainer {

                        VStack(
                            alignment: .leading,
                            spacing: AppSpacing.small
                        ) {

                            Text("No trips yet.")
                                .font(AppTypography.bodyBold)

                            Text("Tap Trips to add your first Schengen trip.")
                                .font(AppTypography.caption)
                                .foregroundStyle(AppColors.secondaryText)

                        }

                    }

                } else {

                    VStack(
                        spacing: AppSpacing.medium
                    ) {

                        ForEach(
                            viewModel.recentTrips.prefix(3)
                        ) { trip in

                            TripCard(
                                trip: trip
                            )

                        }

                    }

                }

            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.xxLarge)
            .padding(.bottom, AppSpacing.large)

        }
        .background(AppColors.background)
        .onAppear {

            viewModel.refresh(
                trips: trips
            )

        }
        .onChange(of: trips) {

            viewModel.refresh(
                trips: trips
            )

        }

    }

}

#Preview {
    HomeView()
}
