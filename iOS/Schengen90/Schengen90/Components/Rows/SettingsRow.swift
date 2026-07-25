//
//  SettingsRow.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct SettingsRow: View {

    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {

        Button {

            action()

        } label: {

            CardContainer {

                HStack(spacing: AppSpacing.medium) {

                    Image(systemName: icon)
                        .foregroundStyle(AppColors.primary)
                        .frame(width: 24)

                    Text(title)
                        .font(AppTypography.body)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)

                }

            }

        }
        .buttonStyle(.plain)

    }

}

#Preview {

    VStack(spacing: AppSpacing.medium) {

        SettingsRow(
            title: "Calculation Rules",
            icon: "function",
            action: {}
        )

        SettingsRow(
            title: "Date Format",
            icon: "calendar",
            action: {}
        )

        SettingsRow(
            title: "Privacy Policy",
            icon: "hand.raised",
            action: {}
        )

    }
    .padding()

}
