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
    
    @State
    private var selectedTrip: Trip?
    
    private var groupedTrips: [Int: [Trip]] {

        Dictionary(
            grouping: trips
        ) { trip in

            trip.entryYear

        }

    }
    
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
                    
                    ForEach(trips) { trip in

                        Button {

                            selectedTrip = trip

                        } label: {

                            TripCard(
                                entryDate: trip.entryDate,
                                exitDate: trip.exitDate,
                                stayDays: trip.stayDays,
                                status: trip.isPlanned ? "Planned" : "Completed",
                                statusColor: trip.isPlanned
                                    ? AppColors.warning
                                    : AppColors.success
                            )

                        }
                        .buttonStyle(.plain)

                    }

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

                            Text("Add your Schengen trips from the last 180 days to calculate your remaining legal stay.")
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.secondaryText)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 280)
                            
                            Text("Trips older than 180 days do not contribute towards stay calculations.")
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
        
        .sheet(item: $selectedTrip) { trip in

            Text(trip.dateRange)
                .font(.title)

        }
        .background(AppColors.background)

    }

}

#Preview {

    TripsView()
        .modelContainer(for: Trip.self, inMemory: true)

}
