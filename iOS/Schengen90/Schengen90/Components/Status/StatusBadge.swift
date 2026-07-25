//
//  StatusBadge.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI

struct StatusBadge: View {

    let title: String
    let color: Color

    var body: some View {

        Text(title)
            .font(AppTypography.caption)
            .foregroundStyle(.white)
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.small)
            .background(color)
            .clipShape(Capsule())

    }
}

#Preview {

    VStack(spacing: AppSpacing.medium) {

        StatusBadge(
            title: "Allowed",
            color: AppColors.success
        )

        StatusBadge(
            title: "Warning",
            color: AppColors.warning
        )

        StatusBadge(
            title: "Exceeded",
            color: AppColors.error
        )

    }
    .padding()
}
