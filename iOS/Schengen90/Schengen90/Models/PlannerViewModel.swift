//
//  PlannerViewModel.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import Observation

@Observable
final class PlannerViewModel {

    var plannedEntry: Date = Calendar.current.startOfDay(
        for: Date()
    )

    var result: StaySimulationResult?

    private let plannerService = PlannerService()

    func calculate(
        existingTrips: [Trip]
    ) {

        result = plannerService.planTrip(
            existingTrips: existingTrips,
            proposedEntryDate: plannedEntry
        )

    }

}
