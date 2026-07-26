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
    
    // MARK: - Next Day
    
    @Test
    func consecutiveDaysAreCountedCorrectly() {

        let entry = makeDate(2027, 3, 1)

        let exit = makeDate(2027, 3, 2)

        #expect(
            DateCalculator.stayDays(
                from: entry,
                to: exit
            ) == 2
        )

    }
    
    // MARK: - 31 Day Month
    
    @Test
    func thirtyOneDayMonth() {

        let entry = makeDate(2027, 1, 1)

        let exit = makeDate(2027, 1, 31)

        #expect(
            DateCalculator.stayDays(
                from: entry,
                to: exit
            ) == 31
        )

    }
    
    // MARK: - February with 28 days
    
    @Test
    func leapYearFebruary() {

        let entry = makeDate(2028, 2, 28)

        let exit = makeDate(2028, 3, 1)

        #expect(
            DateCalculator.stayDays(
                from: entry,
                to: exit
            ) == 3
        )

    }
    
    @Test
    func ninetyDayStay() {

        let entry = makeDate(2027, 1, 1)

        let exit = makeDate(2027, 3, 31)

        #expect(
            DateCalculator.stayDays(
                from: entry,
                to: exit
            ) == 90
        )

    }

}
