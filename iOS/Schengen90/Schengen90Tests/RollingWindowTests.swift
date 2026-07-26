//
//  RollingWindowTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing
@testable import Schengen90

struct RollingWindowTests {

    @Test
    func filtersDatesInsideWindow() {

        let formatter = DateFormatter.tripDate

        let dates: Set<Date> = [

            formatter.date(from: "01 Jan 2026")!,
            formatter.date(from: "15 Feb 2026")!,
            formatter.date(from: "10 Jul 2026")!

        ]

        let reference = formatter.date(from: "26 Jul 2026")!

        let rollingWindow = RollingWindow()

        let result = rollingWindow.dates(
            from: dates,
            referenceDate: reference
        )

        #expect(result.count == 2)

    }

}
