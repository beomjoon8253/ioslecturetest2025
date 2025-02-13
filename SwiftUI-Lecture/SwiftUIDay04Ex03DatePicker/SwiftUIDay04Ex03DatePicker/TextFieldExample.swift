import SwiftUI

struct TextFieldExample: View {
    @State private var name: String = ""
    @State private var email: String = ""

    var body: some View {
        VStack {
            
            HStack {
                Text("이  름:")
                TextField("이름", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack {
                Text("이메일:")
                TextField("이메일", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .padding()
            }

            Text("입력한 이름: \(name)")
        }
        .padding()
    }
}

#Preview {
    TextFieldExample()
}
