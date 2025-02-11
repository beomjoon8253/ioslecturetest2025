import SwiftUI

struct ProductListView: View {
    @StateObject private var dataLoader = ProductDataLoader()

    var body: some View {
        NavigationView {
            List(dataLoader.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product)
                }
            }
            .navigationTitle("과일 마트")
        }
    }
}

#Preview {
    ProductListView()
}
