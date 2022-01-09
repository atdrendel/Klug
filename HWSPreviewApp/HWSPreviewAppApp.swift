import SwiftUI
import WeSplit

@main
struct HWSPreviewAppApp: App {
    var body: some Scene {
        WindowGroup {
            WeSplitMainApp()
        }
    }
}

struct P_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitMainApp()
    }
}
