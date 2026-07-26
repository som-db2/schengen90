//
//  Schengen90App.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import SwiftUI
import SwiftData

@main
struct Schengen90App: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            MainTabView()
        }
        .modelContainer(for: Trip.self)
    }
}
