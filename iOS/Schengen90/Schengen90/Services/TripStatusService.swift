//
//  TripStatusService.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation

enum DisplayTripStatus {

    case planned
    case ongoing
    case completed

}

struct TripStatusService {

    static func status(
        for trip: Trip,
        today: Date = Date()
    ) -> DisplayTripStatus {

        if trip.isPlanned {

            return .planned

        }

        let calendar = Calendar.current

        let currentDay = calendar.startOfDay(for: today)

        let entry = calendar.startOfDay(for: trip.entryDate)

        let exit = calendar.startOfDay(for: trip.exitDate)

        if currentDay >= entry &&
            currentDay <= exit {

            return .ongoing

        }

        return .completed

    }

}
