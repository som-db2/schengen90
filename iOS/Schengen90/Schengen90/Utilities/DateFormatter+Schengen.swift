//
//  DateFormatter+Schengen.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation

extension DateFormatter {

    static let tripDate: DateFormatter = {

        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.calendar = Calendar(identifier: .gregorian)

        formatter.dateFormat = "dd MMM yyyy"

        return formatter

    }()

}
    