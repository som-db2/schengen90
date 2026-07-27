//
//  PlannerService.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation

struct PlannerService {

    private let calculator = SchengenCalculator()

    func planTrip(
        existingTrips: [Trip],
        proposedEntryDate: Date
    ) -> StaySimulationResult? {

        let occupiedDates = TripDateExpander()
            .occupiedDates(from: existingTrips)

        return StaySimulator().simulate(
            occupiedDates: occupiedDates,
            proposedEntryDate: proposedEntryDate
        )

    }

}
