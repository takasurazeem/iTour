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
                    NavigationLink(value: destination) {
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
                .onDelete(perform: deleteDestinations)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        for destination in destinations {
            modelContext.delete(destination)
        }
        let Palestine = Destination(
            name: "Palestine",
            details: "Qibla e Awwal and 3rd holiest site in Islam."
        )
        let Makkah = Destination(
            name: "Makkah 🕋",
            details: "Qibla and the holiest site in Islam.",
            priority: 1
        )
        let Madinah = Destination(
            name: "Madinah",
            details: "Prophet Muhammad's Masjid and the second holiest site in Islam.",
            priority: 1
        )
        let Islamabad = Destination(
            name: "Islamabad",
            details: "Capital of the Pakistan.",
            priority: 1
        )
        
        if destinations.isEmpty {
            modelContext.insert(Palestine)
            modelContext.insert(Makkah)
            modelContext.insert(Madinah)
            modelContext.insert(Islamabad)
        }
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
