import SwiftUI

struct AutoComposedView: View {
    var body: some View {
        VStack {
            if Bool.random() {
                Text("랜덤 참")
            } else {
                Text("랜덤 거짓")
            }
        }
    }
}

#Preview {
    AutoComposedView()
}
