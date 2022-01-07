import Klug
import PlaygroundSupport
import SwiftUI

public struct _SettingsImageModifier: ViewModifier {
    private let color: Color

    public init(_ color: Color) {
        self.color = color
    }

    public func body(content: Content) -> some View {
        content
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .frame(width: 35, height: 35)
            .background(
                RoundedRectangle(
                    cornerSize: .init(width: 8, height: 8)
                )
                .fill(color)
            )
            .font(.title3)
    }
}

struct Preview: View {
    var body: some View {
        preview
            .frame(width: 320)
    }

    var preview: some View {
        HStack {
            Label {
                Text("Any Text")
            } icon: {
                Image(systemName: "swift")
                    .modifier(_SettingsImageModifier(.yellow))
            }

            Spacer()
            Text("Any Text")
                .foregroundColor(.secondary)
            
        }
        
    }
}

print(type(of: Preview().preview))

PlaygroundPage.current.setLiveView(Preview())
