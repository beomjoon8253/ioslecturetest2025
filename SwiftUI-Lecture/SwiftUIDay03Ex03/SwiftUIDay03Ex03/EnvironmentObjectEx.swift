import SwiftUI

class UserSettings: ObservableObject {
    @Published var username: String = "Guest"
}

struct ParentView3: View {
    @StateObject var settings = UserSettings()

    var body: some View {
        ChildView().environmentObject(settings)
    }
}

struct ChildView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        Text("Hello, \(settings.username)!")
            .font(.largeTitle)
    }
}

struct EnvironmentObjectEx: View {
    var body: some View {
        ParentView3()
    }
}

#Preview {
    EnvironmentObjectEx()
}
