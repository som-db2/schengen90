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

        if exitDate < entryDate {

            errors.append(
                "Exit date must be on or after the entry date."
            )

        }

        return errors

    }

}
