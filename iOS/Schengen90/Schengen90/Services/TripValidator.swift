//
//  TripValidator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct TripValidator {

    static func validate(
        entryDate: Date,
        exitDate: Date
    ) -> [String] {

        var errors: [String] = []
        
        let calendar = Calendar.current
        
        let today = calendar.startOfDay(for: Date())

        let entry = calendar.startOfDay(for: entryDate)

        let exit = calendar.startOfDay(for: exitDate)

        //--------------------------------------------------
        // Rule 1
        //--------------------------------------------------

        if exit < entry {

            errors.append(
                "Exit date must be on or after the entry date."
            )

        }
        
        //--------------------------------------------------
        // Rule 2
        //--------------------------------------------------
        
        if entry > today {

            errors.append(
                "Entry date cannot be in the future."
            )

        }
        
        //--------------------------------------------------
        // Rule 3
        //--------------------------------------------------

        if exit > today {

            errors.append(
                "Exit date cannot be in the future."
            )

        }
        
        //--------------------------------------------------
        // Rule 4
        //--------------------------------------------------

        let stayDays = DateCalculator.stayDays(
            from: entryDate,
            to: exitDate
        )
        
        if stayDays > 90 {

            errors.append(
                "A single Schengen trip cannot exceed 90 days under the Schengen 90/180 rule."
            )

        }

        return errors

    }
    
    static func validate(
        trips: [Trip]
    ) -> [String] {

        var errors: [String] = []

        let sortedTrips = trips.sorted {
            $0.entryDate < $1.entryDate
        }

        guard sortedTrips.count > 1 else {
            return errors
        }

        for index in 1..<sortedTrips.count {

            let previousTrip = sortedTrips[index - 1]
            let currentTrip = sortedTrips[index]

            if currentTrip.entryDate < previousTrip.exitDate {

                errors.append(
                    "Trips cannot overlap."
                )

                break

            }

        }

        return errors

    }

}
