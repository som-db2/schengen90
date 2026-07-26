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
    
    @Test
    func existingNinetyDayHistoryDeniesEntry() {

        let formatter = DateFormatter.tripDate

        let expander = TripDateExpander()

        let simulator = StaySimulator()

        let history = [

            Trip(
                entryDate: formatter.date(from: "01 Jan 2026")!,
                exitDate: formatter.date(from: "31 Mar 2026")!
            )

        ]

        let occupiedDates = expander.occupiedDates(from: history)

        let result = simulator.simulate(
            occupiedDates: occupiedDates,
            proposedEntryDate: formatter.date(from: "15 Feb 2026")!
        )

        #expect(result.latestLegalExit == nil)

    }
    
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

}
