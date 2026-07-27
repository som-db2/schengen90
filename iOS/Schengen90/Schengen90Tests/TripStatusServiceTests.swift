//
//  TripStatusServiceTests.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import Testing

@testable import Schengen90

struct TripStatusServiceTests {

    @Test
    func plannedTripReturnsPlanned() {

        let formatter = DateFormatter.tripDate

        let trip = Trip(
            entryDate: formatter.date(from: "01 Sep 2026")!,
            exitDate: formatter.date(from: "10 Sep 2026")!,
            isPlanned: true
        )

        #expect(
            TripStatusService.status(for: trip)
            == .planned
        )

    }

    @Test
    func completedTripReturnsCompleted() {

        let formatter = DateFormatter.tripDate

        let trip = Trip(
            entryDate: formatter.date(from: "01 Jan 2026")!,
            exitDate: formatter.date(from: "10 Jan 2026")!
        )

        let today = formatter.date(from: "20 Jan 2026")!

        #expect(
            TripStatusService.status(
                for: trip,
                today: today
            ) == .completed
        )

    }

    @Test
    func ongoingTripReturnsOngoing() {

        let formatter = DateFormatter.tripDate

        let trip = Trip(
            entryDate: formatter.date(from: "01 Jan 2026")!,
            exitDate: formatter.date(from: "10 Jan 2026")!
        )

        let today = formatter.date(from: "05 Jan 2026")!

        #expect(
            TripStatusService.status(
                for: trip,
                today: today
            ) == .ongoing
        )

    }

    @Test
    func exitDayIsStillOngoing() {

        let formatter = DateFormatter.tripDate

        let trip = Trip(
            entryDate: formatter.date(from: "01 Jan 2026")!,
            exitDate: formatter.date(from: "10 Jan 2026")!
        )

        let today = formatter.date(from: "10 Jan 2026")!

        #expect(
            TripStatusService.status(
                for: trip,
                today: today
            ) == .ongoing
        )

    }

}
