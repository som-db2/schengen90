//
//  TripFormView.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import SwiftUI

struct TripFormView: View {

    @Binding var entryDate: Date
    @Binding var exitDate: Date
    @Binding var notes: String

    var body: some View {

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

            Section("Notes") {

                TextField(
                    "Optional notes",
                    text: $notes,
                    axis: .vertical
                )
                .lineLimit(3...6)

            }

        }

    }

}

#Preview {

    TripFormView(
        entryDate: .constant(Date()),
        exitDate: .constant(Date()),
        notes: .constant("")
    )

}
