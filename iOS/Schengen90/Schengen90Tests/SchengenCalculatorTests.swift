//
//  SchengenCalculatorTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing
@testable import Schengen90

struct SchengenCalculatorTests {

    @Test
    func statusForSingleTrip() {

        let formatter = DateFormatter.tripDate

        let trip = Trip(
            entryDate: formatter.date(from: "10 Jul 2026")!,
            exitDate: formatter.date(from: "15 Jul 2026")!
        )

        let calculator = SchengenCalculator()

        let status = calculator.status(
            from: [trip],
            on: formatter.date(from: "26 Jul 2026")!
        )

        #expect(status.usedDays == 6)
        #expect(status.remainingDays == 84)
        #expect(status.occupiedDates.count == 6)
        #expect(status.isCompliant)

    }

}
