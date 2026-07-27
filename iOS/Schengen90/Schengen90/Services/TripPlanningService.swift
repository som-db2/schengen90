//
//  TripPlanningService.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import SwiftData

struct TripPlanningService {

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

        try? context.save()

        return trip

    }

}
