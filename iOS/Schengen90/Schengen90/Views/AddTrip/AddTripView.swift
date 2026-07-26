//
//  AddTripView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct AddTripView: View {

    // MARK: - Properties

    @Environment(\.dismiss)
    private var dismiss

    @State
    private var entryDate = Date()

    @State
    private var exitDate = Date()

    @State
    private var notes = ""

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

                        // Step 3:
                        // Save to SwiftData

                    }
                    .fontWeight(.semibold)

                }

            }

        }

    }

}

#Preview {

    AddTripView()

}
