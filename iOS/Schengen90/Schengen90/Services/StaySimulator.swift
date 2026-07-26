//
//  StaySimulator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct StaySimulator {

    func simulate(
        occupiedDates: Set<Date>,
        proposedEntryDate: Date
    ) -> StaySimulationResult {

        let calendar = Calendar.current
        
        let latestExit = calendar.date(
            byAdding: .day,
            value: 89,
            to: proposedEntryDate
        )!

        return StaySimulationResult(
            entryDate: proposedEntryDate,
            latestLegalExit: latestExit,
            simulatedDays: 90,
            finalStatus: SchengenStatus(
                referenceDate: latestExit,
                occupiedDates: [],
                usedDays: 90,
                remainingDays: 0,
                isCompliant: true
            )
        )

    }

}
