//
//  Trip+ComputedProperties.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

extension Trip {

    var stayDays: Int {

        DateCalculator.stayDays(
            from: entryDate,
            to: exitDate
        )

    }

    var formattedEntryDate: String {

        DateFormatter.tripDate.string(
            from: entryDate
        )

    }

    var formattedExitDate: String {

        DateFormatter.tripDate.string(
            from: exitDate
        )

    }

    var dateRange: String {

        "\(formattedEntryDate) – \(formattedExitDate)"

    }

}
