//
//  DateCalculator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct DateCalculator {

    static func stayDays(
        from entryDate: Date,
        to exitDate: Date
    ) -> Int {

        let calendar = Calendar.current

        let entry = calendar.startOfDay(for: entryDate)

        let exit = calendar.startOfDay(for: exitDate)

        let difference = calendar.dateComponents(
            [.day],
            from: entry,
            to: exit
        ).day ?? 0

        return difference + 1

    }

}
