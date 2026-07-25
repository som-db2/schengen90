//
//  SectionHeader.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI

struct SectionHeader: View {

    let title: String

    var body: some View {
        Text(title)
            .font(AppTypography.heading)
            .foregroundStyle(AppColors.primaryText)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SectionHeader(title: "Recent Trips")
        .padding()
}
