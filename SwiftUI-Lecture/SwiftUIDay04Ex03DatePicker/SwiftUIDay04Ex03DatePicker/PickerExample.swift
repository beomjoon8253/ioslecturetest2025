import SwiftUI

struct PickerExample: View {
    @State private var selectedColor = "Red"
    let colors = ["Red", "Green", "Blue"]

    var body: some View {
        VStack {
            Text("선택한 색상: \(selectedColor)")
            Picker("색상 선택", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

#Preview {
    PickerExample()
}
