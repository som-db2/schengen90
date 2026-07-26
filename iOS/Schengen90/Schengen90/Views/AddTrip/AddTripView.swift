//
//  AddTripView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI
import SwiftData

struct AddTripView: View {

    // MARK: - Properties

    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.modelContext)
    private var modelContext

    @State
    private var entryDate = Date()

    @State
    private var exitDate = Date()

    @State
    private var notes = ""

    private var validationErrors: [String] {

        TripValidator.validate(
            entryDate: entryDate,
            exitDate: exitDate
        )

    }
    
    // MARK: - Body

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
                
                Section("Notes (Optional)") {
                    
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
            .navigationTitle("Add Trip")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    Button("Cancel") {

                        dismiss()

                    }

                }

                ToolbarItem(placement: .topBarTrailing) {

                    Button("Save") {

                        let trip = Trip(
                            entryDate: entryDate,
                            exitDate: exitDate,
                            notes: notes.trimmingCharacters(in: .whitespacesAndNewlines)
                        )

                        modelContext.insert(trip)

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

    AddTripView()

}
