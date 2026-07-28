//
//  HomeView.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {

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
                    .padding(.bottom, AppSpacing.small)

                VStack(
                    alignment: .leading,
                    spacing: AppSpacing.xSmall
                ) {

                    Text(viewModel.greetingTitle)
                        .font(AppTypography.body)
                        .foregroundStyle(AppColors.secondaryText)

                    Text(viewModel.greetingMessage)
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.secondaryText)

                }
                .padding(.bottom, AppSpacing.small)

                // MARK: - Remaining Days

                SectionHeader(title: "Remaining Days")
                CardContainer {

                    VStack(
                        spacing: AppSpacing.xxSmall
                    ) {

                        Text("\(viewModel.remainingDays)")
                            .font(AppTypography.hero)

                        Text("Days Remaining")
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.secondaryText)

                    }
                    .frame(maxWidth: .infinity)

                }

                // MARK: - Latest Legal Exit

                SectionHeader(title: "Latest Legal Exit")
                
                CardContainer {

                    Text(viewModel.latestLegalExit)
                        .font(AppTypography.title)
                        .frame(maxWidth: .infinity)
                    
                    Text("Based on entry today")
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.secondaryText)
                        .frame(maxWidth: .infinity)

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
                                "Your next planned trip starts on"
                            )
                            .font(AppTypography.body)

                            Text(
                                DateFormatter.tripDate.string(
                                    from: trip.entryDate
                                )
                            )
                            .font(AppTypography.title)
                            .frame(maxWidth: .infinity)

                        }

                    } else {

                        VStack(
                            alignment: .leading,
                            spacing: AppSpacing.small
                        ) {

                            Text("No planned trips.")
                                .font(AppTypography.bodyBold)

                            Text("Use Planner to create your next trip.")
                                .font(AppTypography.caption)
                                .foregroundStyle(AppColors.secondaryText)

                        }

                    }

                }
                
                // MARK: - Trip Summary

                SectionHeader(title: "Trip Summary")

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
            .padding(.horizontal, AppSpacing.screen)
            .padding(.top, AppSpacing.xLarge)
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
