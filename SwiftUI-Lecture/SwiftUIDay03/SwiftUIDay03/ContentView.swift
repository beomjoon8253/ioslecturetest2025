//
//  ContentView.swift
//  SwiftUIDay03
//
//  Created by BEOMJOON KIM on 2025.02.12.
//

import SwiftUI

class CntClass {
    var count: Int
    
    init(_ count: Int = 0) {
        self.count = count
    }
}

struct HomeView: View {
    // 상태 변수 - 재 랜더링 된다.
    // @State var count = 0
    // 레퍼런스로 선언하고 레퍼런스의 필드를 변경 한다.
    var countRef: CntClass = CntClass()
    
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Welcome to Home")
                .padding(20)
            
            Button("증가") {
                print("증가 버튼 눌렀다", countRef.count)
                countRef.count += 1
            }
        }
    }
}

struct Settings: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .resizable()
                .frame(width: 200, height: 200)
            Text("System Setting Page")
        }
    }
}

struct Profile: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Profile Page")
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            Settings().tabItem {
                Label("Settings", systemImage: "gear")
            }
            Profile().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    ContentView()
}
