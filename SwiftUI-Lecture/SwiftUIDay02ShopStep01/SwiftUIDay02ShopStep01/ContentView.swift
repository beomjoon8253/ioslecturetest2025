import SwiftUI

class CntClass {
    var cnt: Int = 0
    var numList: [Int] = []
    
    init(cnt: Int) {
        self.cnt = cnt
    }
}

struct ContentView: View {
    var cntInctance: CntClass = .init(cnt: 0)

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                cntInctance.cnt += 1
                print(cntInctance.cnt)
                cntInctance.numList.append(cntInctance.cnt)
                print(cntInctance.numList)

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
