//
//  SchengenCalculator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

//
//  SchengenCalculator.swift
//  Schengen90
//

import Foundation

struct SchengenCalculator {

    private let tripDateExpander = TripDateExpander()
    private let rollingWindow = RollingWindow()

    func status(
        from trips: [Trip],
        on referenceDate: Date
    ) -> SchengenStatus {

        let occupiedDates = tripDateExpander.occupiedDates(from: trips)

        let datesInWindow = rollingWindow.dates(
            from: occupiedDates,
            referenceDate: referenceDate
        )

        let usedDays = datesInWindow.count

        return SchengenStatus(
            referenceDate: referenceDate,
            occupiedDates: datesInWindow,
            usedDays: usedDays,
            remainingDays: max(0, 90 - usedDays),
            isCompliant: usedDays <= 90
        )

    }

}
