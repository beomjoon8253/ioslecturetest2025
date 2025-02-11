import SwiftUI

extension Color {
    /// HEX 문자열을 사용하여 Color를 생성하는 초기화 메서드
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted) // 공백 및 # 제거
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int) // HEX 값을 UInt64로 변환

        let a, r, g, b: Double
        switch hex.count {
        case 6: // HEX 코드 #RRGGBB
            (a, r, g, b) = (1, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        case 8: // HEX 코드 #AARRGGBB
            (a, r, g, b) = (Double((int >> 24) & 0xFF) / 255, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        default:
            (a, r, g, b) = (1, 1, 1, 1) // 기본값: 흰색
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

