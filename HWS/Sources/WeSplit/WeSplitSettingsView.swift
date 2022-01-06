import SwiftUI

struct WeSplitSettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                   profile
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    var profile: some View {
        Text("Some VIew")
    }
}

struct WeSplitSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitSettingsView()
    }
}
