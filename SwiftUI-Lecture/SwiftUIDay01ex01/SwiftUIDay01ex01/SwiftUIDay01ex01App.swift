//
//  SwiftUIDay01ex01App.swift
//  SwiftUIDay01ex01
//
//  Created by BEOMJOON KIM on 2025.02.10.
//

import SwiftUI

@main
struct SwiftUIDay01ex01App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
