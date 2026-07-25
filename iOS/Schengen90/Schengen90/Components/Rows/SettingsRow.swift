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
    let value: String?
    let action: (() -> Void)?
    let isDestructive: Bool

    init(
        title: String,
        icon: String,
        value: String? = nil,
        isDestructive: Bool = false,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.icon = icon
        self.value = value
        self.isDestructive = isDestructive
        self.action = action
    }

    var body: some View {

        Group {

            if let action {

                Button {

                    action()

                } label: {

                    rowContent(showChevron: true)

                }
                .buttonStyle(.plain)

            } else {

                rowContent(showChevron: false)

            }

        }

    }

    @ViewBuilder
    private func rowContent(showChevron: Bool) -> some View {

        CardContainer {

            HStack(spacing: AppSpacing.medium) {

                Image(systemName: icon)
                    .foregroundStyle(
                        isDestructive ? Color.red : AppColors.primary)
                    .frame(width: 24)

                Text(title)
                    .foregroundStyle(
                        isDestructive ? Color.red : .primary
                    )

                Spacer()

                if let value {

                    Text(value)
                        .font(AppTypography.body)
                        .foregroundStyle(.secondary)

                }

                if showChevron {

                    Image(systemName: "chevron.right")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)

                }

            }

        }

    }

}

#Preview {

    VStack(spacing: AppSpacing.medium) {

        SettingsRow(
            title: "Calculation Rules",
            icon: "function"
        ) {
            print("Tapped")
        }

        SettingsRow(
            title: "Date Format",
            icon: "calendar"
        ) {
            print("Tapped")
        }

        SettingsRow(
            title: "App Version",
            icon: "info.circle",
            value: "1.0.0"
        )

    }
    .padding()

}
