import Klug
import SwiftUI

public struct _SettingsImageModifier: ViewModifier {
    private let color: Color

    public init(_ color: Color) {
        self.color = color
    }

    public func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .frame(width: 40, height: 40)
            .background(
                RoundedRectangle(
                    cornerSize: .init(width: 12, height: 12)
                )
                .fill(color.opacity(0.3))
            )
            .font(.title2)
    }
}

public typealias SettingsToggleView = TupleView<(ModifiedContent<Image, _SettingsImageModifier>, Spacer, Toggle<Text>)>

typealias SettingsNagivationLinkView = NavigationLink<HStack<TupleView<(Label<Text, Image>, Spacer, Text)>>, Text>
typealias SettingsView = HStack<SettingsNagivationLinkView>

public extension HStack where Content == SettingsToggleView {
    init(
        _ icon: String,
        _ color: Color,
        _ toggle: Toggle<Text>
    ) {
        self.init {
            Image(systemName: icon)
                .modifier(_SettingsImageModifier(color))
            Spacer()
            toggle
        }
    }
}

struct WeSplitSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var isDarkMode: Bool { colorScheme == .dark }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    profile
                }

                Section {
                    List {}
                }
            }
            .navigationTitle("Settings")
        }
    }

    func settings(icon: String, title: String, content: AnyView) -> some View {
        HStack {
            NavigationLink {
                Text("")
            } label: {
                VStack {
                    Label {
                        Text(title)
                    } icon: {
                        Image(systemName: icon)
                    }
                    content
                }
            }
        }
    }

    var profile: some View {
        HStack {
            NavigationLink {
                Text("some destination")
            } label: {
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .symbolVariant(.circle.fill)
                    .font(.largeTitle)
                    .symbolRenderingMode(.palette)
                    .if(isDarkMode) {
                        $0.foregroundStyle(.green.opacity(0.6), .green)
                    }
                    .else(isDarkMode) {
                        $0.foregroundStyle(.blue.opacity(0.6), .blue)
                    }
                    .padding(.all, 8)
                    .background(Circle().fill(.regularMaterial))
                    .background(Circle().fill(.linearGradient(.init(colors: [.blue, .black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)))
                    .background(Circle().stroke(.gray.opacity(0.1), lineWidth: 4))

                VStack(alignment: .leading, spacing: 5) {
                    Text("Evans Domina Attafuah")
                    Text("Apple ID, iCloud, iTunes & App Store")
                        .font(.caption2)
                }
            }
            .padding(.vertical, 4)
        }
    }
}

struct WeSplitSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitSettingsView().preferredColorScheme(.dark)
        WeSplitSettingsView()
    }
}
