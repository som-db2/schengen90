//
//  HomeViewModel.swift
//  Schengen90
//
//  Created by Som Kundu on 28/07/26.
//

import Foundation

@Observable
final class HomeViewModel {

    private let calculator = SchengenCalculator()

    var remainingDays: Int = 90

    var latestLegalExit: String = "-"

    var tripStatus: String = "Allowed"
    
    var nextPlannedTrip: Trip?
    
    var recentTrips: [Trip] = []

    func refresh(
        trips: [Trip]
    ) {

        let historicalTrips = trips.filter { !$0.isPlanned }

        let today = Calendar.current.startOfDay(for: Date())
        
        let status = calculator.status(
            from: historicalTrips,
            on: today
        )

        remainingDays = status.remainingDays

        if let latestExit = calculator.latestLegalExit(
            existingTrips: historicalTrips,
            proposedEntryDate: today
        ) {

            latestLegalExit = DateFormatter.tripDate.string(
                from: latestExit
            )

        } else {

            latestLegalExit = "-"

        }

        tripStatus = status.isCompliant
            ? "Allowed"
            : "Exceeded"
        
        nextPlannedTrip = trips
            .filter { $0.isPlanned }
            .sorted {
                $0.entryDate < $1.entryDate
            }
            .first
        
        recentTrips = trips
            .filter { !$0.isPlanned }
            .sorted {
                $0.entryDate > $1.entryDate
            }

    }

}
