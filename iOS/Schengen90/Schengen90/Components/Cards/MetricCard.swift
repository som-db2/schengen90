//
//  MetricCard.swift
//  Schengen90
//
//  Created by Som Kundu on 29/07/26.
//

import SwiftUI

struct MetricCard: View {

    let title: String
    let value: String
    let unit: String

    var body: some View {

        CardContainer {

            VStack(
                spacing: AppSpacing.xxSmall
            ) {

                Text(title)
                    .font(AppTypography.heading)
                    .multilineTextAlignment(.center)

                Spacer(minLength: AppSpacing.small)

                Text(value)
                    .font(AppTypography.hero)

                Text(unit)
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.secondaryText)

            }
            .frame(maxWidth: .infinity)

        }

    }

}

#Preview {

    HStack {

        MetricCard(
            title: "Available\non Entry",
            value: "57",
            unit: "Days"
        )

        MetricCard(
            title: "Maximum\nStay",
            value: "90",
            unit: "Days"
        )

    }
    .padding()

}
