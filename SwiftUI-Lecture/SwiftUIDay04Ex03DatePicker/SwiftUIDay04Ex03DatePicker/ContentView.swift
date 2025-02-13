//
//  ContentView.swift
//  SwiftUIDay04Ex03DatePicker
//
//  Created by BEOMJOON KIM on 2025.02.13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            TextFieldExample()
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
