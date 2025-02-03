import SwiftUI

// 메시지 모델
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var messages: [Message] = []

    var body: some View {
        NavigationView {
            VStack {
                // 대화 내용 표시
                ScrollView {
                    ForEach(messages) { message in
                        HStack {
                            if message.isUser {
                                Spacer()
                                Text(message.text)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                    }
                }

                // 입력 필드와 전송 버튼
                HStack {
                    TextField("메시지를 입력하세요...", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        sendMessage()
                    }) {
                        Text("전송")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("챗봇: ELIZA")
        }
    }

    func sendMessage() {
        guard !userInput.isEmpty else { return }

        // 사용자 입력 추가
        let userMessage = Message(text: userInput, isUser: true)
        messages.append(userMessage)

        // ELIZA 응답 생성
        let elizaResponse = generateElizaResponse(to: userInput)
        let botMessage = Message(text: elizaResponse, isUser: false)
        messages.append(botMessage)

        // 입력 필드 초기화
        userInput = ""
    }

    func generateElizaResponse(to input: String) -> String {
        // 패턴-응답 매핑
        let patterns: [String: String] = [
            "안녕": "안녕하세요! 무슨 일이 있으신가요?",
            "기분": "기분이 어떠신가요?",
            "왜": "왜 그렇게 생각하시나요?",
            "문제": "어떤 문제가 있으신가요? 더 말씀해 주세요.",
            "사랑": "사랑에 대해 이야기해 보시겠어요?",
            "부모": "부모님에 대해 이야기해 보세요."
        ]

        // 키워드 기반 응답
        for (keyword, response) in patterns {
            if input.contains(keyword) {
                return response
            }
        }

        // 패턴 매칭 기반 응답
        if let match = matchPattern(input: input, pattern: "내가 (.+)다") {
            return "당신은 '\(match)'라고 생각하시나요?"
        }

        // 기본 응답
        return "더 자세히 말씀해 주실 수 있나요?"
    }

    func matchPattern(input: String, pattern: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(input.startIndex..<input.endIndex, in: input)
            if let match = regex.firstMatch(in: input, options: [], range: range) {
                if let range = Range(match.range(at: 1), in: input) {
                    return String(input[range])
                }
            }
        } catch {
            print("정규식 오류: \(error)")
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
