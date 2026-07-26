//
//  StaySimulatorTests.swift
//  Schengen90
//
//  Created by Som Kundu on 26/07/26.
//

import Foundation
import Testing
@testable import Schengen90

struct StaySimulatorTests {

    @Test
    func simulatorCanBeCreated() {

        let simulator = StaySimulator()

        #expect(simulator != nil)

    }

}
