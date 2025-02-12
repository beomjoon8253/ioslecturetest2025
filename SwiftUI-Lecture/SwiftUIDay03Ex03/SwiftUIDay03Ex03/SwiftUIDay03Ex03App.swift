//
//  SwiftUIDay03Ex03App.swift
//  SwiftUIDay03Ex03
//
//  Created by BEOMJOON KIM on 2025.02.12.
//

import SwiftUI

@main
struct SwiftUIDay03Ex03App: App {
    @StateObject var settings = UserSettings() // 최상위
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
