//
//  InfoCard.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

//
//  InfoCard.swift
//  Schengen90
//

import SwiftUI

struct InfoCard: View {

    let title: String
    let value: String

    var body: some View {

        CardContainer {

            VStack(
                alignment: .leading,
                spacing: AppSpacing.xSmall
            ) {

                Text(title)
                    .font(AppTypography.heading)

                Text(value)
                    .font(AppTypography.title)

            }

            .frame(maxWidth: .infinity,
                   alignment: .leading)


        }

    }

}

#Preview {

    VStack(spacing: AppSpacing.large) {

        InfoCard(
            title: "Trip Duration",
            value: "13 Days"
        )

        InfoCard(
            title: "Remaining Days",
            value: "65"
        )

        InfoCard(
            title: "Latest Legal Exit",
            value: "22 Sep 2026"
        )

    }
    .padding()

}
