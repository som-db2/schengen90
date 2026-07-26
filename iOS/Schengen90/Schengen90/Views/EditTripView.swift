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

    @State
    private var entryDate: Date

    @State
    private var exitDate: Date

    @State
    private var notes: String
    
    private var validationErrors: [String] {

        TripValidator.validate(
            entryDate: entryDate,
            exitDate: exitDate
        )

    }
    
    init(trip: Trip) {

        self.trip = trip

        _entryDate = State(initialValue: trip.entryDate)
        _exitDate = State(initialValue: trip.exitDate)
        _notes = State(initialValue: trip.notes)

    }
    
    var body: some View {

        NavigationStack {

            Form {

                Section("Trip Dates") {

                    DatePicker(
                        "Entry Date",
                        selection: $entryDate,
                        displayedComponents: .date
                    )

                    DatePicker(
                        "Exit Date",
                        selection: $exitDate,
                        displayedComponents: .date
                    )
                    
                    if !validationErrors.isEmpty {
                        
                        Text("Validation")
                            .font(AppTypography.caption)
                            .foregroundStyle(.secondary)

                        ForEach(validationErrors, id: \.self) { error in

                            HStack(alignment: .top, spacing: 6) {

                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundStyle(.red)
                                    .font(.caption)

                                Text(error)
                                    .font(.caption)
                                    .foregroundStyle(.red)

                            }

                        }

                    }

                }

                Section("Notes") {

                    ZStack(alignment: .topLeading) {

                        if notes.isEmpty {

                            Text("Vacation, Business, Family Visit...")
                                .foregroundStyle(.secondary)
                                .padding(.top, 8)
                                .padding(.leading, 5)

                        }

                        TextEditor(text: $notes)
                            .frame(minHeight: 90)

                    }

                }

            }
            .navigationTitle("Edit Trip")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {
                    
                    Button("Cancel") {

                        dismiss()

                    }

                }
                
                ToolbarItem(placement: .topBarTrailing) {

                    Button("Save") {

                        trip.entryDate = entryDate
                        trip.exitDate = exitDate
                        trip.notes = notes.trimmingCharacters(in: .whitespacesAndNewlines)

                        trip.updatedAt = Date()

                        dismiss()

                    }
                    .disabled(!validationErrors.isEmpty)
                    .fontWeight(.semibold)

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
