import SwiftUI

struct NumberFormatterExample: View {
    @State private var number: Double = 0.0  // 입력값을 Double 형으로 저장

    // NumberFormatter 생성 (숫자를 소수점 두 자리로 표시)
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal  // 소수점 형식 적용
        formatter.maximumFractionDigits = 2  // 소수점 2자리까지 표시
        return formatter
    }()

    var body: some View {
        VStack(spacing: 20) {
            Text("입력한 숫자: \(number, specifier: "%.2f")")  
            // 숫자를 소수점 두 자리로 표시

            TextField("숫자 입력", value: $number, formatter: formatter) 
             // 숫자 입력 필드
                .textFieldStyle(RoundedBorderTextFieldStyle())  
                // 둥근 테두리 스타일
                .keyboardType(.decimalPad)  // 숫자 키패드 사용
                .padding()

            Spacer()
        }
        .padding()
    }
}

#Preview {
    NumberFormatterExample()
}
