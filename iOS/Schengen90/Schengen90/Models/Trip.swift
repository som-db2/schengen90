//
//  Trip.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import SwiftData

@Model
final class Trip {

    // MARK: - Properties

    var entryDate: Date
    var exitDate: Date

    var notes: String

    var isPlanned: Bool

    var createdAt: Date
    var updatedAt: Date

    // MARK: - Initializer

    init(
        entryDate: Date,
        exitDate: Date,
        notes: String = "",
        isPlanned: Bool = false
    ) {

        self.entryDate = entryDate
        self.exitDate = exitDate
        self.notes = notes
        self.isPlanned = isPlanned

        let now = Date()

        self.createdAt = now
        self.updatedAt = now

    }

}
