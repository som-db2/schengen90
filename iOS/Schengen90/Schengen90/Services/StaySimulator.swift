//
//  StaySimulator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct StaySimulator {
    
    private let rollingWindow = RollingWindow()
    private let calendar = Calendar.current

    func simulate(
        occupiedDates: Set<Date>,
        proposedEntryDate: Date
    ) -> StaySimulationResult {
        
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
    
    private func simulatedOccupiedDates(
        historical: Set<Date>,
        entryDate: Date,
        exitDate: Date
    ) -> Set<Date> {

        var dates = historical

        var current = entryDate

        while current <= exitDate {

            dates.insert(current)

            current = calendar.date(
                byAdding: .day,
                value: 1,
                to: current
            )!

        }

        return dates

    }

}
