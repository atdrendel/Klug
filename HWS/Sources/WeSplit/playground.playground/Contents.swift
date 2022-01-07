import Klug
import PlaygroundSupport
import SwiftUI

struct Preview: View {
    var body: some View {
        preview
            .frame(width: 320)
    }

    var preview: some View {
        NavigationLink {
            Text("Any Text")
        } label: {
            HStack {
                Image(systemName: "swift")
                Text("WiFi")
                Spacer()
                Text("On")
            }
        }
    }
}

print(type(of: Preview().preview))

PlaygroundPage.current.setLiveView(Preview())
