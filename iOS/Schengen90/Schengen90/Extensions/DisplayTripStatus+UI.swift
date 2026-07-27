//
//  DisplayTripStatus+UI.swift
//  Schengen90
//
//  Created by Som Kundu on 28/07/26.
//

import SwiftUI

extension DisplayTripStatus {

    var title: String {

        switch self {

        case .planned:
            return "Planned"

        case .ongoing:
            return "Ongoing"

        case .completed:
            return "Completed"

        }

    }

    var color: Color {

        switch self {

        case .planned:
            return AppColors.warning

        case .ongoing:
            return AppColors.info

        case .completed:
            return AppColors.success

        }

    }

}
