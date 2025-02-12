//
//  ContentView.swift
//  SwiftUIDay03Ex03
//
//  Created by BEOMJOON KIM on 2025.02.12.
//

import SwiftUI

import SwiftUI

struct ParentView: View {
    @State private var isOn = false  // 상태를 관리하는 @State 프로퍼티

    var body: some View {
        VStack {
            Text("Parent View")
                .font(.title)
                .padding()

            // ToggleView에 @Binding으로 상태 전달
            ToggleView(isOn: $isOn)
                .padding()

            // 상태 변경 여부 표시
            Text("Toggle 상태: \(isOn ? "On" : "Off")")
                .padding()
        }
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool  // 상위 뷰의 상태를 참조하는 @Binding 프로퍼티

    var body: some View {
        Toggle("Switch", isOn: $isOn)  // 바인딩된 상태를 사용
            .padding()
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            ParentView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
