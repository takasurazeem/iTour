//
//  iTourApp.swift
//  iTour
//
//  Created by Takasur Home on 25/03/2024.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
