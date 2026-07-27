//
//  TripValidatorTests.swift
//  Schengen90Tests
//
//  Created by Som Kundu on 27/07/26.
//

import Testing
import Foundation

@testable import Schengen90

struct TripValidatorTests {

    @Test
    func validatorCanBeCreated() {

        _ = TripValidator()

    }

    @Test
    func overlappingTripsAreRejected() {

        let formatter = DateFormatter.tripDate

        let trips = [

            Trip(
                entryDate: formatter.date(from: "01 Jan 2026")!,
                exitDate: formatter.date(from: "10 Jan 2026")!
            ),

            Trip(
                entryDate: formatter.date(from: "05 Jan 2026")!,
                exitDate: formatter.date(from: "15 Jan 2026")!
            )

        ]

        let errors = TripValidator.validate(
            trips: trips
        )

        #expect(errors.isEmpty == false)

    }

}
