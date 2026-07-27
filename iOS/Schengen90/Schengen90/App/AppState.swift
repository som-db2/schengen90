//
//  AppState.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

import Foundation
import Observation

@Observable
final class AppState {

    enum Tab: Hashable {

        case dashboard
        case trips
        case planner
        case settings

    }

    // MARK: - Current Tab

    var selectedTab: Tab = .dashboard

    // MARK: - Selected Trip

    var selectedTrip: Trip?

}
