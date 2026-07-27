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
        
        var simulatedDates = occupiedDates

        var candidateExit = proposedEntryDate

        var latestLegalExit: Date? = nil
        
        while true {
            
            simulatedDates.insert(candidateExit)
            
            let datesInWindow = rollingWindow.dates(
                from: simulatedDates,
                referenceDate: candidateExit
            )
            
            if datesInWindow.count > 90 {
                break
            }
            
            latestLegalExit = candidateExit
            
            candidateExit = calendar.date(
                byAdding: .day,
                value: 1,
                to: candidateExit
            )!

        }
        
        let simulatedDays: Int

        if let latestLegalExit {

            simulatedDays =
                calendar.dateComponents(
                    [.day],
                    from: proposedEntryDate,
                    to: latestLegalExit
                ).day! + 1

        } else {

            simulatedDays = 0

        }

        let finalReferenceDate = latestLegalExit ?? proposedEntryDate

        let finalDates = rollingWindow.dates(
            from: simulatedDates,
            referenceDate: finalReferenceDate
        )

        let finalStatus = SchengenStatus(
            referenceDate: finalReferenceDate,
            occupiedDates: finalDates,
            usedDays: finalDates.count,
            remainingDays: max(0, 90 - finalDates.count),
            isCompliant: finalDates.count <= 90
        )

        return StaySimulationResult(
            entryDate: proposedEntryDate,
            latestLegalExit: latestLegalExit,
            simulatedDays: simulatedDays,
            finalStatus: finalStatus
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
