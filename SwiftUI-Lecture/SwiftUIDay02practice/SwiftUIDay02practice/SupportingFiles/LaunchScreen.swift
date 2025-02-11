import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "applelogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("과일마트")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
