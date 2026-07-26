//
//  TripDateExpander.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct TripDateExpander {

    func occupiedDates(from trips: [Trip]) -> Set<Date> {

        var occupied = Set<Date>()

        for trip in trips {

            var currentDate = DateCalculator.normalizedDate(trip.entryDate)
            let exitDate = DateCalculator.normalizedDate(trip.exitDate)

            while currentDate <= exitDate {

                occupied.insert(currentDate)

                guard let nextDate = Calendar.current.date(
                    byAdding: .day,
                    value: 1,
                    to: currentDate
                ) else {
                    break
                }

                currentDate = nextDate
            }
        }

        return occupied
    }
}
