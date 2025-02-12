import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var userAge: String = ""
    @State private var isDarkMode: Bool = false
    
    @State private var fruits: [String] = []  // 불러온 데이터를 저장할 배열

    var body: some View {
        VStack(spacing: 20) {
            Button("저장하기") {
                let favoriteFruits = ["Apple", "Banana", "Cherry"]
                UserDefaults.standard.set(favoriteFruits, forKey: "favoriteFruits")
                print("저장된 과일: \(favoriteFruits)")
            }

            Button("불러오기") {
                if let loadedFruits = UserDefaults.standard.array(forKey: "favoriteFruits") as? [String] {
                    fruits = loadedFruits
                    print("불러온 과일: \(loadedFruits)")
                } else {
                    print("저장된 데이터가 없습니다.")
                }
            }

            Text("불러온 과일: \(fruits.joined(separator: ", "))")
                .padding()
        }
        .padding()
        NavigationView {
            Form {
                Section(header: Text("사용자 정보 입력")) {
                    TextField("이름 입력", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("나이 입력", text: $userAge)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Section(header: Text("다크 모드 설정")) {
                    Toggle("다크 모드 활성화", isOn: $isDarkMode)
                }

                Section {
                    Button("저장하기") {
                        saveData()
                    }
                    Button("데이터 불러오기") {
                        loadData()
                    }
                }
            }
            .navigationTitle("UserDefaults 실습")
        }
    }

    // 데이터 저장 함수
    func saveData() {
        UserDefaults.standard.set(userName, forKey: "userName")
        if let age = Int(userAge) {
            UserDefaults.standard.set(age, forKey: "userAge")
        }
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        UserDefaults.standard.synchronize() // 디스크에 즉시 기록
        print("✅ 데이터 저장 완료")
    }

    // 데이터 불러오기 함수
    func loadData() {
        userName = UserDefaults.standard.string(forKey: "userName") ?? "Unknown"
        userAge = "\(UserDefaults.standard.integer(forKey: "userAge"))"
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        print("📄 데이터 불러오기 완료")
    }
}

#Preview {
    ContentView()
}
