//
//  DateCalculator.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

struct DateCalculator {

    private static let calendar = Calendar.current

    static func normalizedDate(_ date: Date) -> Date {

        calendar.startOfDay(for: date)

    }

    static func stayDays(
        from entryDate: Date,
        to exitDate: Date
    ) -> Int {

        let entry = normalizedDate(entryDate)
        let exit = normalizedDate(exitDate)

        let difference = calendar.dateComponents(
            [.day],
            from: entry,
            to: exit
        ).day ?? 0

        return difference + 1

    }

}
