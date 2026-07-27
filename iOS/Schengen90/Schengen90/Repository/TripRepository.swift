//
//  TripRepository.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import SwiftData
import Observation

@Observable
final class TripRepository {

    // MARK: - Properties

    private let modelContext: ModelContext

    // MARK: - Initializer

    init(modelContext: ModelContext) {

        self.modelContext = modelContext

    }

    // MARK: - Fetch

    func allTrips() -> [Trip] {

        let descriptor = FetchDescriptor<Trip>(
            sortBy: [
                SortDescriptor(\.entryDate, order: .reverse)
            ]
        )

        do {

            return try modelContext.fetch(descriptor)

        } catch {

            assertionFailure("Failed to fetch trips: \(error)")
            return []

        }

    }

    // MARK: - Save

    func add(_ trip: Trip) {

        modelContext.insert(trip)

        save()

    }

    // MARK: - Delete

    func delete(_ trip: Trip) {

        modelContext.delete(trip)

        save()

    }

    // MARK: - Save Context

    private func save() {

        do {

            try modelContext.save()

        } catch {

            assertionFailure("Failed to save context: \(error)")

        }

    }

}
