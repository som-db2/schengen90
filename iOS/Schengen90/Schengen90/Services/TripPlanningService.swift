//
//  TripPlanningService.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import SwiftData

struct TripPlanningService {

    @discardableResult
    func createPlannedTrip(
        entryDate: Date,
        latestLegalExit: Date,
        context: ModelContext
    ) -> Trip {

        let trip = Trip(
            entryDate: entryDate,
            exitDate: latestLegalExit,
            isPlanned: true
        )

        context.insert(trip)

        do {

            try context.save()

        } catch {

            assertionFailure(
                "Failed to save planned trip: \(error)"
            )

        }

        return trip

    }

}
