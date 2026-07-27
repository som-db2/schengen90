//
//  NavigationCoordinator.swift
//  Schengen90
//
//  Created by Som Kundu on 27/07/26.
//

//
//  NavigationCoordinator.swift
//  Schengen90
//

import Foundation
import Observation

@Observable
final class NavigationCoordinator {

    // MARK: - Tabs

    enum Tab: Hashable {

        case dashboard
        case trips
        case planner
        case settings

    }

    // MARK: - Navigation State

    var selectedTab: Tab = .dashboard

    // MARK: - Planner → Trips

    var selectedTrip: Trip?

}
