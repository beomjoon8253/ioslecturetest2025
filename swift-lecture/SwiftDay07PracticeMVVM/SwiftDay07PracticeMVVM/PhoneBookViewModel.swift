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

