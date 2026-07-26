//
//  TripDateExpanderTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing
@testable import Schengen90

struct TripDateExpanderTests {

    @Test
    func singleTripProducesCorrectDates() {

        let trip = Trip(
            entryDate: DateFormatter.tripDate.date(from: "10 Jan 2026")!,
            exitDate: DateFormatter.tripDate.date(from: "12 Jan 2026")!
        )

        let expander = TripDateExpander()

        let dates = expander.occupiedDates(from: [trip])

        #expect(dates.count == 3)
    }

    @Test
    func sameDayReentryCountsDayOnlyOnce() {

        let trip1 = Trip(
            entryDate: DateFormatter.tripDate.date(from: "10 Jan 2026")!,
            exitDate: DateFormatter.tripDate.date(from: "15 Jan 2026")!
        )

        let trip2 = Trip(
            entryDate: DateFormatter.tripDate.date(from: "15 Jan 2026")!,
            exitDate: DateFormatter.tripDate.date(from: "21 Jan 2026")!
        )

        let expander = TripDateExpander()

        let dates = expander.occupiedDates(from: [trip1, trip2])

        #expect(dates.count == 12)
    }
}
