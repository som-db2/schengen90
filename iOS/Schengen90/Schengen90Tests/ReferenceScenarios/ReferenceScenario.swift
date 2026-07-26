//
//  ReferenceScenario.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
@testable import Schengen90

struct ReferenceScenario {

    let name: String

    let trips: [Trip]

    let referenceDate: Date

    let expectedUsedDays: Int

    let expectedRemainingDays: Int

}
