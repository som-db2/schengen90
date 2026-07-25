//
//  CardContainer.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI

struct CardContainer<Content: View>: View {

    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            content
        }
        .padding(AppSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppColors.card)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppCornerRadius.card
            )
        )
    }
}

#Preview {
    CardContainer {
        Text("Remaining Days")
            .font(AppTypography.heading)

        Text("65")
            .font(AppTypography.largeTitle)

        Text("Days Remaining")
            .font(AppTypography.body)
    }
    .padding()
}
