//
//  DateFormatter+Extensions.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation

extension DateFormatter {

    static let displayDate: DateFormatter = {

        let formatter = DateFormatter()

        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current

        formatter.dateFormat = "dd MMM yyyy"

        return formatter

    }()

}
