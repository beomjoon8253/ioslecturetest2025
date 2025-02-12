//
//  ContentView.swift
//  SwiftUIDay03Ex02
//
//  Created by BEOMJOON KIM on 2025.02.12.
//

import SwiftUI

struct ContentView: View {
    
    @ViewBuilder
    func createContentView(_ showTitle: Bool) -> some View {
        if showTitle {
            Text("나의 앱").font(.largeTitle)
        }
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    
    var body: some View {
        createContentView(false)
    }
}

#Preview {
    ContentView()
}
