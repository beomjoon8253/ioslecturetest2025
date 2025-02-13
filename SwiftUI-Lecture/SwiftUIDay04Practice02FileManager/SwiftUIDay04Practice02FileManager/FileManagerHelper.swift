import SwiftUI

struct User: Codable {
    var id: UUID
    var name: String
    var age: Int
}

class FileManagerHelper {
    static let shared = FileManagerHelper()
    private let fileName = "users.json"

    func saveUsers(_ users: [User]) {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent(fileName)

        let encoder = JSONEncoder()
        if let data = try? encoder.encode(users) {
            do {
                try data.write(to: fileURL)
                print("데이터 저장 성공: \(fileURL)")
            } catch {
                print("저장 실패: \(error)")
            }
        }
    }

    func loadUsers() -> [User] {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent(fileName)

        if let data = try? Data(contentsOf: fileURL) {
            let decoder = JSONDecoder()
            if let users = try? decoder.decode([User].self, from: data) {
                print("데이터 불러오기 성공")
                return users
            }
        }
        print("데이터 불러오기 실패")
        return []
    }
}
