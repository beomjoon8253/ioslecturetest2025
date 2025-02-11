//
//  ContentView.swift
//  SwiftUIDay02practice
//
//  Created by BEOMJOON KIM on 2025.02.11.
//


import SwiftUI

struct ContentView: View {
    let items = ["사과", "바나나", "오렌지", "포도", "수박"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: DetailView(item: item)) {
                    Text(item)
                        .font(.headline)
                        .padding()
                }
            }
            .navigationTitle("과일 목록")
        }
    }
}

struct DetailView: View {
    let item: String

    var body: some View {
        VStack {
            NavigationLink(destination: SubDtailView()) {
                Text("\(item) 상세 정보")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }

            Text("\(item)은(는) 맛있고 건강에 좋은 과일입니다.")
                .font(.body)
                .padding()

            Spacer()
        }
        .navigationTitle("\(item) 상세")
    }
}

struct SubDtailView: View {
    var body: some View {
        Text("Sub Detail View")
    }
}

#Preview {
    ContentView()
}
