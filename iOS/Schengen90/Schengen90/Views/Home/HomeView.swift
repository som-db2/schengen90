//
//  HomeView.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI

struct HomeView: View {

    // MARK: - Temporary Demo Data
    // These will later come from HomeViewModel

    private let remainingDays = 65
    private let latestLegalExit = "22 September 2026"
    private let tripStatus = "Allowed"

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

                    Text("\(remainingDays)")
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

                    Text(latestLegalExit)
                        .font(AppTypography.title)
                        .frame(maxWidth: .infinity)

                    Spacer()
                        .frame(height: AppSpacing.small)

                    StatusBadge(
                        title: tripStatus,
                        color: AppColors.success
                    )

                }

                // MARK: - Add Trip Button

                PrimaryButton(title: "Add Trip") {

                }

                // MARK: - Recent Trips

                SectionHeader(title: "Recent Trips")

                CardContainer {

                    VStack(
                        alignment: .leading,
                        spacing: AppSpacing.small
                    ) {

                        Text("No trips yet.")
                            .font(AppTypography.bodyBold)

                        Text("Tap \"Add Trip\" to create your first Schengen trip.")
                            .font(AppTypography.caption)
                            .foregroundStyle(AppColors.secondaryText)

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
    HomeView()
}
