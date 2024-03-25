//
//  ContentView.swift
//  iTour
//
//  Created by Takasur Home on 25/03/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var destinations: [Destination]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(
                            destination.date.formatted(
                                date: .long,
                                time: .shortened
                            )
                        )
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        let Palestine = Destination(
            name: "Palestine",
            details: "Qibla e Awwal and 3rd holiest site in Islam"
        )
        let Makkah = Destination(
            name: "Makkah 🕋",
            details: "Qibla and the holiest site in Islam",
            priority: 1
        )
        let Madinah = Destination(
            name: "Madinah",
            details: "Prophet Muhammad's Masjid and the second holiest site in Islam",
            priority: 1
        )
        
        if destinations.isEmpty {
            modelContext.insert(Palestine)
            modelContext.insert(Makkah)
            modelContext.insert(Madinah)
        }
    }
}

#Preview {
    ContentView()
}
