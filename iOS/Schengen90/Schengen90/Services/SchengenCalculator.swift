//
//  SchengenCalculator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct SchengenCalculator {

    private let tripDateExpander = TripDateExpander()
    private let rollingWindow = RollingWindow()

    func usedDays(
        from trips: [Trip],
        on referenceDate: Date
    ) -> Int {

        let occupiedDates = tripDateExpander.occupiedDates(from: trips)

        let datesInWindow = rollingWindow.dates(
            from: occupiedDates,
            referenceDate: referenceDate
        )

        return datesInWindow.count

    }

}
