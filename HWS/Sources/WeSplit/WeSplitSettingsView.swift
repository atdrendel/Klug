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
        HStack {
            NavigationLink {
                Text("some destination")
            } label: {
                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 32))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .blue.opacity(0.3))
                    .padding()
                    .background(Circle().fill(.ultraThinMaterial))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Evans Domina Attafuah")
                    Text("Apple ID, iCloud, iTunes & App Store")
                        .font(.caption2)
                }
            }

        }
    }
}

struct WeSplitSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitSettingsView()
    }
}
