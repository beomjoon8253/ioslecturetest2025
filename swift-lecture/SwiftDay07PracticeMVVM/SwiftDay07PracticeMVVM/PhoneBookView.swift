import Foundation

class PhoneBookView {
    private let viewModel = PhoneBookViewModel()

    func menu() {
        while true {
            print("""
                  ::::: 전화 번호부 :::::
                  1) 추가 2) 목록 출력 3) 검색 4) 수정 5) 삭제 6) 종료
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

