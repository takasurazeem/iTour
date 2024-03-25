//
//  Destination.swift
//  iTour
//
//  Created by Takasur Home on 25/03/2024.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    
    init(
        name: String = "",
        details: String = "",
        date: Date = .now,
        priority: Int = 2
    ) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
