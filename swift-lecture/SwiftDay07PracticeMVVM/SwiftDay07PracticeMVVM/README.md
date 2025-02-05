# MVVM(Model-View-ViewModel) 패턴의 `PhoneBook` 예제.
- **Model**: 연락처 데이터를 저장하는 구조체 (`Contact`)
- **ViewModel**: 데이터와 비즈니스 로직을 처리하는 `PhoneBookViewModel`
- **View**: 사용자 입력을 처리하는 `PhoneBookView`

---

### **📌 1. Model (연락처 데이터)**
```swift
import Foundation

// 연락처 데이터 모델
struct Contact: Identifiable {
    var id: Int
    var name: String
    var phone: String
}
```

---

### **📌 2. ViewModel (전화번호부 비즈니스 로직)**
```swift
import Foundation

class PhoneBookViewModel {
    private var seq: Int = 4
    private var phoneBook: [Contact] = [
        Contact(id: 1, name: "Kim", phone: "010-1111-1111"),
        Contact(id: 2, name: "Lee", phone: "010-1111-1112"),
        Contact(id: 3, name: "Park", phone: "010-1111-1113")
    ]

    // 📌 연락처 추가
    func addContact(name: String, phone: String) {
        let newContact = Contact(id: seq, name: name, phone: phone)
        phoneBook.append(newContact)
        seq += 1
    }

    // 📌 연락처 출력
    func listContacts() {
        print("------ 연락처 목록 ------")
        print("ID\t이름\t전화번호")
        for contact in phoneBook {
            print("\(contact.id)\t\(contact.name)\t\(contact.phone)")
        }
    }

    // 📌 연락처 검색
    func searchContact(name: String) -> Contact? {
        return phoneBook.first { $0.name == name }
    }

    // 📌 연락처 수정
    func modifyContact(name: String, newName: String, newPhone: String) -> Bool {
        if let index = phoneBook.firstIndex(where: { $0.name == name }) {
            phoneBook[index].name = newName
            phoneBook[index].phone = newPhone
            return true
        }
        return false
    }

    // 📌 연락처 삭제
    func deleteContact(name: String) -> Bool {
        if let index = phoneBook.firstIndex(where: { $0.name == name }) {
            phoneBook.remove(at: index)
            return true
        }
        return false
    }
}
```

---

### **📌 3. View (사용자 입력 및 메뉴 인터페이스)**
```swift
import Foundation

class PhoneBookView {
    private let viewModel = PhoneBookViewModel()

    func menu() {
        while true {
            print("""
                  ::::: 전화 번호부 :::::
                  1) 추가
                  2) 목록 출력
                  3) 검색
                  4) 수정
                  5) 삭제
                  6) 종료
                  """)
            print("선택: ", terminator: "")

            guard let choice = readLine(), let option = Int(choice) else {
                print("⚠️ 잘못된 입력입니다.")
                continue
            }

            switch option {
            case 1:
                addContact()
            case 2:
                viewModel.listContacts()
            case 3:
                searchContact()
            case 4:
                modifyContact()
            case 5:
                deleteContact()
            case 6:
                print("프로그램을 종료합니다.")
                return
            default:
                print("⚠️ 올바른 번호를 입력하세요.")
            }
        }
    }

    // 연락처 추가
    private func addContact() {
        print("이름 입력: ", terminator: "")
        guard let name = readLine(), !name.isEmpty else { return }

        print("전화번호 입력: ", terminator: "")
        guard let phone = readLine(), !phone.isEmpty else { return }

        viewModel.addContact(name: name, phone: phone)
        print("✅ 연락처 추가 완료")
    }

    // 연락처 검색
    private func searchContact() {
        print("검색할 이름 입력: ", terminator: "")
        guard let name = readLine(), !name.isEmpty else { return }

        if let contact = viewModel.searchContact(name: name) {
            print("🔎 검색 결과: \(contact.name) - \(contact.phone)")
        } else {
            print("❌ 검색 결과가 없습니다.")
        }
    }

    // 연락처 수정
    private func modifyContact() {
        print("수정할 이름 입력: ", terminator: "")
        guard let name = readLine(), !name.isEmpty else { return }

        print("새 이름 입력: ", terminator: "")
        guard let newName = readLine(), !newName.isEmpty else { return }

        print("새 전화번호 입력: ", terminator: "")
        guard let newPhone = readLine(), !newPhone.isEmpty else { return }

        if viewModel.modifyContact(name: name, newName: newName, newPhone: newPhone) {
            print("✅ 연락처 수정 완료")
        } else {
            print("❌ 수정 실패: 해당 연락처가 없습니다.")
        }
    }

    // 연락처 삭제
    private func deleteContact() {
        print("삭제할 이름 입력: ", terminator: "")
        guard let name = readLine(), !name.isEmpty else { return }

        if viewModel.deleteContact(name: name) {
            print("✅ 연락처 삭제 완료")
        } else {
            print("❌ 삭제 실패: 해당 연락처가 없습니다.")
        }
    }
}
```

---

### **📌 4. 실행 파일 (Entry Point)**
```swift
let phoneBookView = PhoneBookView()
phoneBookView.menu()
```

---

### **📌 MVVM 패턴 적용된 구조**
📌 **Model (데이터)**  
✅ `Contact` 구조체: 연락처 정보를 저장하는 데이터 모델  

📌 **ViewModel (비즈니스 로직)**  
✅ `PhoneBookViewModel`: 연락처 추가, 수정, 삭제, 검색 등의 비즈니스 로직 처리  

📌 **View (사용자 입력 및 UI 로직)**  
✅ `PhoneBookView`: 사용자 입력을 받아 ViewModel의 함수를 호출하여 처리  

---

### **📌 개선된 점**
1. **클래스 간 역할 분리**  
   - View (`PhoneBookView`)는 사용자와의 상호작용만 담당  
   - ViewModel (`PhoneBookViewModel`)은 데이터 로직만 담당하여 유지보수 용이  

2. **코드 가독성 향상**  
   - 데이터 처리와 UI 로직을 분리하여 코드 가독성이 향상됨  

3. **테스트 및 확장 용이**  
   - ViewModel이 UI와 독립적이므로, UI 없이 단독 테스트가 가능  
