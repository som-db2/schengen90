//
//  HomeView.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: AppSpacing.large
            ) {

                Text("Schengen90")
                    .font(AppTypography.largeTitle)

                Text(GreetingHelper.greeting())
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.secondaryText)

                CardContainer {

                    Text("Remaining Days")
                        .font(AppTypography.heading)

                    Text("65")
                        .font(.system(size: 56, weight: .bold))
                        .frame(maxWidth: .infinity)

                    Text("Days Remaining")
                        .font(AppTypography.body)
                        .frame(maxWidth: .infinity)

                }
                
                CardContainer {

                    Text("Latest Legal Exit")
                        .font(AppTypography.heading)

                    Text("22 September 2026")
                        .font(AppTypography.title)

                    StatusBadge(
                        title: "Allowed",
                        color: AppColors.success
                    )

                }
                
                PrimaryButton(
                    title: "Add Trip"
                ) {

                }
                
                SectionHeader(
                    title: "Recent Trips"
                )

                CardContainer {

                    Text("No trips yet.")

                }
                
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.xLarge)
            .padding(.bottom, AppSpacing.large)

        }
        .background(AppColors.background)

    }

}

#Preview {
    HomeView()
}
