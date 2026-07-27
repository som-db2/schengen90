//
//  TripStatusService.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation

enum DisplayTripStatus: Equatable {

    case planned
    case ongoing
    case completed

}

struct TripStatusService {

    static func status(
        for trip: Trip,
        today: Date = Date()
    ) -> DisplayTripStatus {

        let calendar = Calendar.current

        let currentDay = calendar.startOfDay(for: today)

        let entry = calendar.startOfDay(for: trip.entryDate)

        let exit = calendar.startOfDay(for: trip.exitDate)

        //--------------------------------------------------
        // Planned
        //--------------------------------------------------

        if trip.isPlanned || currentDay < entry {

            return .planned

        }

        //--------------------------------------------------
        // Ongoing
        //--------------------------------------------------

        if currentDay <= exit {

            return .ongoing

        }

        //--------------------------------------------------
        // Completed
        //--------------------------------------------------

        return .completed

    }

}
