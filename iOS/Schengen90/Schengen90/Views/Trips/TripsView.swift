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

import SwiftUI

struct TripsView: View {

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
