//
//  StaySimulatorTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing
@testable import Schengen90

struct StaySimulatorTests {

    @Test
    func simulatorCanBeCreated() {

        _ = StaySimulator()

    }
    
    // Empty History Allows Ninety Days Stay
    
    @Test
    func emptyHistoryAllowsNinetyDayStay() {

        let formatter = DateFormatter.tripDate

        let simulator = StaySimulator()

        let result = simulator.simulate(
            occupiedDates: [],
            proposedEntryDate: formatter.date(from: "01 Jan 2026")!
        )

        #expect(result.latestLegalExit == formatter.date(from: "31 Mar 2026")!)

        #expect(result.simulatedDays == 90)

    }
    
    // Same Day Exit and Re-entry Counts as Single Occupied Day
    
    @Test
    func sameDayExitAndReentryCountsAsSingleOccupiedDay() {

        let formatter = DateFormatter.tripDate

        let expander = TripDateExpander()

        let simulator = StaySimulator()

        let history = [

            Trip(
                entryDate: formatter.date(from: "18 Nov 2025")!,
                exitDate: formatter.date(from: "14 Feb 2026")!
            )

        ]

        let occupiedDates = expander.occupiedDates(from: history)

        let result = simulator.simulate(
            occupiedDates: occupiedDates,
            proposedEntryDate: formatter.date(from: "15 Feb 2026")!
        )

        #expect(
            result.latestLegalExit ==
            formatter.date(from: "15 Feb 2026")!
        )
        
        #expect(result.simulatedDays == 1)

    }

    // Eighty Nine Days History Allows One Additional Day
    
    @Test
    func eightyNineDaysHistoryAllowsOneAdditionalDay() {

        let formatter = DateFormatter.tripDate

        let expander = TripDateExpander()

        let simulator = StaySimulator()

        let history = [

            Trip(
                entryDate: formatter.date(from: "19 Nov 2025")!,
                exitDate: formatter.date(from: "15 Feb 2026")!
            )

        ]

        let occupiedDates = expander.occupiedDates(from: history)

        let result = simulator.simulate(
            occupiedDates: occupiedDates,
            proposedEntryDate: formatter.date(from: "15 Feb 2026")!
        )

        #expect(
            result.latestLegalExit ==
            formatter.date(from: "16 Feb 2026")!
        )

        #expect(result.simulatedDays == 2)

    }

}
