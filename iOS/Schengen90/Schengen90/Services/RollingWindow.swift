//
//  RollingWindow.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct RollingWindow {

    func dates(
        from dates: Set<Date>,
        referenceDate: Date
    ) -> [Date] {

        let calendar = Calendar.current

        let normalizedReference = DateCalculator.normalizedDate(referenceDate)

        guard let windowStart = calendar.date(
            byAdding: .day,
            value: -179,
            to: normalizedReference
        ) else {
            return []
        }

        return dates
            .filter { date in
                date >= windowStart &&
                date <= normalizedReference
            }
            .sorted()

    }

}
