import SwiftUI

struct WeSplitMainApp: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, world!")
            }

            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
        }
    }
}

struct WeSplitMainApp_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitMainApp()
    }
}
