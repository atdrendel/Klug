import Klug
import PlaygroundSupport
import SwiftUI

struct Preview: View {
    var body: some View {
        preview
            .frame(width: 320)
    }

    var preview: some View {
        HStack {
            Image(systemName: "swift")
                .modifier(_SettingsImageModifier())
            Spacer()
            Toggle("some text", isOn: .constant(true))
        }
    }
}

print(type(of: Preview().preview))

PlaygroundPage.current.setLiveView(Preview())
