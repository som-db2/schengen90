//
//  PrimaryButton.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTypography.bodyBold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(AppSpacing.medium)
                .background(AppColors.primary)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: AppCornerRadius.button
                    )
                )
        }
    }
}

#Preview {
    PrimaryButton(title: "Add Trip") {

    }
    .padding()
}
