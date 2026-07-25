//
//  DateField.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct DateField: View {

    let title: String
    let date: String
    let action: () -> Void

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.small
        ) {

            Text(title)
                .font(AppTypography.heading)

            Button {

                action()

            } label: {
                
                CardContainer {

                    HStack {

                        Text(date)
                            .font(AppTypography.body)

                        Spacer()

                        Image(systemName: "calendar")
                            .foregroundStyle(AppColors.primary)

                    }

                }

            }
            .buttonStyle(.plain)

        }

    }

}

#Preview {

    VStack(
        spacing: AppSpacing.large
    ) {

        DateField(
            title: "Planned Entry",
            date: "10 Sep 2026",
            action: { }
        )

        DateField(
            title: "Planned Exit",
            date: "22 Sep 2026",
            action: { }
        )

    }
    .padding()
    
}
