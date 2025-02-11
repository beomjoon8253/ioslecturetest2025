//
//  HomeView.swift
//  SwiftUIDay02ShopStep01
//
//  Created by BEOMJOON KIM on 2025.02.11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ProductListView().navigationTitle("과일 상회")
        }
    }
}

#Preview {
    HomeView()
}
