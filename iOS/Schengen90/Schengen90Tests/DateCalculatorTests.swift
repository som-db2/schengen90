//
//  DateCalculatorTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing

@testable import Schengen90

struct DateCalculatorTests {

    // MARK: - Helper

    private func makeDate(
        _ year: Int,
        _ month: Int,
        _ day: Int
    ) -> Date {

        let calendar = Calendar(identifier: .gregorian)

        return calendar.date(
            from: DateComponents(
                year: year,
                month: month,
                day: day
            )
        )!

    }

    // MARK: - Same Day

    @Test
    func sameDayTripIsOneDay() {

        let entry = makeDate(2027, 3, 1)

        let exit = makeDate(2027, 3, 1)

        #expect(
            DateCalculator.stayDays(
                from: entry,
                to: exit
            ) == 1
        )

    }

}
