//
//  TripsView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI
import SwiftData

struct TripsView: View {

    // MARK: - SwiftData

    @Query(
        sort: \Trip.entryDate,
        order: .reverse
    )
    private var trips: [Trip]

    // MARK: - Body

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: AppSpacing.large) {

                if trips.isEmpty {

                    // MARK: - Empty State

                    VStack(spacing: AppSpacing.large) {

                        Image(systemName: "airplane.departure")
                            .font(.system(size: 64))
                            .foregroundStyle(AppColors.secondaryText)

                        Text("No Trips Yet")
                            .font(AppTypography.heading)

                        Text("Tap the + button to add your first Schengen trip.")
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.secondaryText)
                            .multilineTextAlignment(.center)

                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 80)

                } else {

                    // MARK: - Temporary Placeholder

                    CardContainer {

                        VStack(alignment: .leading, spacing: AppSpacing.small) {

                            Text("Trips in Database")
                                .font(AppTypography.heading)

                            Text("\(trips.count)")
                                .font(AppTypography.hero)
                                .foregroundStyle(AppColors.primary)

                        }

                    }

                }

            }
            .padding(AppSpacing.screen)

        }
        .navigationTitle("Trips")

    }

}

#Preview {

    TripsView()
        .modelContainer(for: Trip.self, inMemory: true)

}
