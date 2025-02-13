import SwiftUI

struct DatePickerExample: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            Text("선택한 날짜: \(selectedDate, formatter: dateFormatter)")
            DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
        }
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    DatePickerExample()
}
