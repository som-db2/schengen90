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

    let entryDate: String
    let exitDate: String
    let duration: String
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

                Text("\(entryDate) → \(exitDate)")
                    .font(AppTypography.body)

                // MARK: - Duration

                Text(duration)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.secondaryText)

            }

        }

    }

}

#Preview {

    VStack(spacing: 20) {

        TripCard(
            entryDate: "11 Jun 2026",
            exitDate: "16 Jul 2026",
            duration: "Duration: 36 days",
            status: "Completed",
            statusColor: AppColors.success
        )

        TripCard(
            entryDate: "02 Sep 2026",
            exitDate: "15 Sep 2026",
            duration: "Duration: 14 days",
            status: "Planned",
            statusColor: AppColors.warning
        )

    }
    .padding()

}
