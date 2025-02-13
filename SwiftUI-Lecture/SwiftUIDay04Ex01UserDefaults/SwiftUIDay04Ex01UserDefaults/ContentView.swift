import SwiftUI

struct ContentView: View {
    // 사용자 정보
    @State private var userName: String = ""
    // TextField로 입력 된 데이터는 일단 문자열입니다.
    @State private var userAge: String = ""
    // 앱 설정 정보
    @State private var isDarkMode: Bool = false
    
    // MARK: - body 함수
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("사용자 정보")) {
                    TextField("이름", text: $userName)
                    TextField("나이", text: $userAge)
                }
                Section(header: Text("다크 모드 설정")) {
                    Toggle("다크 모드 설정", isOn: $isDarkMode)
                }
                Section(header: Text("동작을 선택하세요") ) {
                    Button("데이터 저장하기") {
                        saveData()
                    }
                    Button("데이터 불러오기") {
                        loadData()
                    }
                }
            }
        }
    } // end of body
}
    
extension ContentView {
    // MARK: - 저장 기능
    func saveData() {
        UserDefaults.standard.set(userName, forKey: "userName")
        if let age = Int(userAge) {
            // 텍트 필드로 입력 받은 데이터를 Int형으로 형변환 후 저장
            UserDefaults.standard.set(age, forKey: "userAge")
        }
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        print("데이터 저장 완료!")
    }
    
    // MARK: - 불러오기 기능
    func loadData() {
        // State 상태변수에 데이터를 다시 불러 들이기.
        userName = UserDefaults.standard.string(forKey: "userName") ?? ""
        // userAge는 문자열 타입이다. 문자열로 형변환 필요.
        let age = UserDefaults.standard.integer(forKey: "userAge")
        userAge = "\(age)"
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        print("불러오기 완료")
    }
} // end of extension

#Preview {
    ContentView()
}
