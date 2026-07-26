//
//  EditTripView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI
import SwiftData

struct EditTripView: View {

    @Bindable var trip: Trip

    @Environment(\.dismiss)
    private var dismiss

    var body: some View {

        NavigationStack {

            Form {

                Section("Trip") {

                    Text(trip.dateRange)

                }

            }
            .navigationTitle("Edit Trip")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    Button("Close") {

                        dismiss()

                    }

                }

            }

        }

    }

}

#Preview {

    EditTripView(
        trip: Trip(
            entryDate: Date(),
            exitDate: Date()
        )
    )

}
