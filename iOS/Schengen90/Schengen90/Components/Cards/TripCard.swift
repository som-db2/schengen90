//
//  TripCard.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//  Modified by Som Kundu on 27/07/26.

//
//  TripCard.swift
//  Schengen90
//

import SwiftUI

struct TripCard: View {

    let trip: Trip
    
    private var status: DisplayTripStatus {

        TripStatusService.status(for: trip)

    }
    
    var body: some View {

        CardContainer {

            VStack(
                alignment: .leading,
                spacing: AppSpacing.small
            ) {

                // MARK: - Header

                HStack(alignment: .top) {

                    StatusBadge(
                        title: status.title,
                        color: status.color
                    )
                    
                }

                // MARK: - Dates

                Text(
                    "\(DateFormatter.tripDate.string(from: trip.entryDate)) → \(DateFormatter.tripDate.string(from: trip.exitDate))"
                )
                    .font(AppTypography.body)

                // MARK: - Duration

                Text("Duration: \(trip.stayDays) day\(trip.stayDays == 1 ? "" : "s")")
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.secondaryText)

            }

        }

    }

}

#Preview {

    VStack(spacing: 20) {

        TripCard(
            trip: Trip(
                entryDate: Calendar.current.date(
                    from: DateComponents(
                        year: 2026,
                        month: 6,
                        day: 11
                    )
                )!,
                exitDate: Calendar.current.date(
                    from: DateComponents(
                        year: 2026,
                        month: 7,
                        day: 16
                    )
                )!
            )
        )

        TripCard(
            trip: Trip(
                entryDate: Calendar.current.date(
                    from: DateComponents(
                        year: 2026,
                        month: 9,
                        day: 2
                    )
                )!,
                exitDate: Calendar.current.date(
                    from: DateComponents(
                        year: 2026,
                        month: 9,
                        day: 15
                    )
                )!,
                isPlanned: true
            )
        )

    }
    .padding()

}
