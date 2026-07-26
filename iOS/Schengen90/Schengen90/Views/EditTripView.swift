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

                Section("Trip Dates") {

                    DatePicker(
                        "Entry Date",
                        selection: $trip.entryDate,
                        displayedComponents: .date
                    )

                    DatePicker(
                        "Exit Date",
                        selection: $trip.exitDate,
                        displayedComponents: .date
                    )

                }

                Section("Notes") {

                    ZStack(alignment: .topLeading) {

                        if trip.notes.isEmpty {

                            Text("Vacation, Business, Family Visit...")
                                .foregroundStyle(.secondary)
                                .padding(.top, 8)
                                .padding(.leading, 5)

                        }

                        TextEditor(text: $trip.notes)
                            .frame(minHeight: 90)

                    }

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
