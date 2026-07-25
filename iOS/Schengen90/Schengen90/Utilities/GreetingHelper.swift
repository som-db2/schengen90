//
//  GreetingHelper.swift
//  Schengen90
//
//  Created by Som Kundu on 25/07/26.
//

import Foundation

enum GreetingHelper {

    static func greeting() -> String {

        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {

        case 5..<12:
            return "Good Morning"

        case 12..<17:
            return "Good Afternoon"

        case 17..<22:
            return "Good Evening"

        default:
            return "Good Night"

        }
    }

}
