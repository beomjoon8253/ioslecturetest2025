
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ProductListView()
                .navigationTitle("과일마트")
        }
    }
}

#Preview {
    HomeView()
}
