//
//  ReferenceScenarioTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing
@testable import Schengen90

struct ReferenceScenarioTests {

    @Test
    func simpleThirtyDayStay() {

        let formatter = DateFormatter.tripDate

        let scenario = ReferenceScenario(

            name: "Simple 30 Day Stay",

            trips: [

                Trip(
                    entryDate: formatter.date(from: "01 Jan 2026")!,
                    exitDate: formatter.date(from: "30 Jan 2026")!
                )

            ],

            referenceDate: formatter.date(from: "15 Feb 2026")!,

            expectedUsedDays: 30,

            expectedRemainingDays: 60

        )

        let calculator = SchengenCalculator()

        let status = calculator.status(
            from: scenario.trips,
            on: scenario.referenceDate
        )

        #expect(status.usedDays == scenario.expectedUsedDays)

        #expect(status.remainingDays == scenario.expectedRemainingDays)

    }

}
