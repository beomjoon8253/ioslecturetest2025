import SwiftUI

struct ParentView2: View {
    @State var isOn = false
    var body: some View {
        Text("isOn: \(isOn)")
        ToggleView2(isOn: $isOn)
    }
}

struct ToggleView2: View {
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Toggle("IsOn", isOn: $isOn)
        }
        .padding()
    }
}

struct BindToggleEx: View {
    var body: some View {
        ParentView2()
    }
}

#Preview {
    BindToggleEx()
}
