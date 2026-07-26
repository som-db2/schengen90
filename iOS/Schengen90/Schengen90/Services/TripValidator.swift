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

        let duration = calendar.dateComponents(
            [.day],
            from: entry,
            to: exit
        ).day ?? 0
        
        if duration > 180 {

            errors.append(
                "A single Schengen trip cannot exceed 180 days."
            )

        }

        return errors

    }

}
