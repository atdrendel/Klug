import SwiftUI
import AppSettingsKit

@main
struct SettingsKitPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Form {
                    NavigationLink(profile: .init(name: .init())) {
                        Text("Any View")
                    }
                }
            }
        }
    }
}
