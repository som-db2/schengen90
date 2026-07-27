//
//  PlannerService.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

//import Foundation

//struct PlannerService {

//    private let calculator = SchengenCalculator()

//    func planTrip(
  //      existingTrips: [Trip],
    //    proposedEntryDate: Date
  //  ) -> StaySimulationResult? {

    //    let occupiedDates = TripDateExpander()
      //      .occupiedDates(from: existingTrips)

      //  return StaySimulator().simulate(
        //    occupiedDates: occupiedDates,
          //  proposedEntryDate: proposedEntryDate
       // )

//    }

//}

//
//  PlannerService.swift
//

import Foundation

struct PlannerService {

    func planTrip(
        existingTrips: [Trip],
        proposedEntryDate: Date
    ) -> StaySimulationResult? {

        let occupiedDates = TripDateExpander()
            .occupiedDates(from: existingTrips)

        print("===================================")
        print("Planner Debug")
        print("Historical Trips : \(existingTrips.count)")
        print("Occupied Days    : \(occupiedDates.count)")
        print("Proposed Entry   : \(proposedEntryDate)")
        print("===================================")

        return StaySimulator().simulate(
            occupiedDates: occupiedDates,
            proposedEntryDate: proposedEntryDate
        )

    }

}
