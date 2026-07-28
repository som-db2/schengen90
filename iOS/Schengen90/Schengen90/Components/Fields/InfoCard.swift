//
//  InfoCard.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//  Modified by Som Kundu on 29/07/26.
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
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )

        }

    }

}
