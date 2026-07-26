//
//  TripCard.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

//
//  TripCard.swift
//  Schengen90
//

import SwiftUI

struct TripCard: View {

    let entryDate: Date
    let exitDate: Date
    let stayDays: Int
    let status: String
    let statusColor: Color

    var body: some View {

        CardContainer {

            VStack(
                alignment: .leading,
                spacing: AppSpacing.medium
            ) {

                // MARK: - Header

                HStack(alignment: .top) {

                    StatusBadge(
                        title: status,
                        color: statusColor
                    )

                }

                // MARK: - Dates

                Text(
                    "\(DateFormatter.tripDate.string(from: entryDate)) → \(DateFormatter.tripDate.string(from: exitDate))"
                )
                    .font(AppTypography.body)

                // MARK: - Duration

                Text("Duration: \(stayDays) day\(stayDays == 1 ? "" : "s")")
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.secondaryText)

            }

        }

    }

}

#Preview {

    VStack(spacing: 20) {

        TripCard(
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
            )!,
            stayDays: 36,
            status: "Completed",
            statusColor: AppColors.success
        )

        TripCard(
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
            stayDays: 14,
            status: "Planned",
            statusColor: AppColors.warning
        )

    }
    .padding()

}
