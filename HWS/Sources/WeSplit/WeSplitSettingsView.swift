import Klug
import SwiftUI

public enum SettingsType {
    case profile
    case toggle
    case text
}

struct Setting: Identifiable {
    let id = UUID().uuidString
    let icon: Symbol
    let title: String
    var subtitle = ""
}

extension Setting {
    struct _SymbolVariantsModifier: ViewModifier {
        private let variant: SymbolVariants

        init(_ variant: SymbolVariants = .none) {
            self.variant = variant
        }

        func body(content: Content) -> some View {
            content.symbolVariant(variant)
        }
    }

    typealias _SettingVariantView = ModifiedContent<Image, _SymbolVariantsModifier>


    enum Symbol: String, CaseIterable {
        case airplane
        case wifi
        case bluetooth = "dot.radiowaves.right"
        case mobileData = "antenna.radiowaves.left.and.right"
        case personalHotspot = "personalhotspot"
        case vpn = "network"
        case notifications = "bell.badge"
        case soundsAndHaptic = "speaker.wave.3"
        case doNotDisturb = "moon"
        case hourglass = "hourglass"

        func variant(_ variant: SymbolVariants = .none) -> _SettingVariantView {
            Image(systemName: rawValue).modifier(_SymbolVariantsModifier(variant))
        }
    }
}

@resultBuilder
enum SettingBuilder {
    static func buildBlock(_ setting: Setting...) -> [Setting] { setting }
}

@resultBuilder
enum SettingArrayBuilder {
    static func buildEither(first settings: [Setting]) -> [Setting] { settings }

    static func buildEither(second component: [Setting]) -> [Setting] { component }

    static func buildOptional(_ component: [Setting]?) -> [Setting] { component ?? [] }

    static func buildExpression(_ expression: Setting) -> [Setting] { [expression] }

    static func buildExpression(_ expression: ()) -> [Setting] { [] }

    static func buildBlock(_ settings: [Setting]...) -> [Setting] { settings.flatMap { $0 } }
}

// MARK: - Smoothie List

extension Setting {
    @SettingArrayBuilder
    static var all: [Setting] {
        Setting(icon: .airplane, title: "Airplane Mode")
    }
}

struct _SettingsImageModifier: ViewModifier {
    private let color: Color

    init(_ color: Color) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
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

typealias _SettingsToggleView = TupleView<(ModifiedContent<Image, _SettingsImageModifier>, Spacer, Toggle<Text>)>

typealias _SettingsNagivationLinkViewTextTupleView = TupleView<(ModifiedContent<Image, _SettingsImageModifier>, Text, Spacer, Text)>
typealias _SettingsNagivationLinkViewText = HStack<_SettingsNagivationLinkViewTextTupleView>
typealias _SettingsNagivationLinkViewEmptyTupleView = TupleView<(ModifiedContent<Image, _SettingsImageModifier>, Text, Spacer, EmptyView)>
typealias _SettingsNagivationLinkViewEmpty = HStack<_SettingsNagivationLinkViewEmptyTupleView>

extension NavigationLink where Label == _SettingsNagivationLinkViewText {
    init(
        _ icon: String,
        _ color: Color,
        _ title: String,
        _ subtitle: String,
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        self.init(
            destination: destination,
            label: {
                HStack {
                    Image(systemName: icon)
                        .modifier(_SettingsImageModifier(color))
                    Text(title)
                    Spacer()
                    Text(subtitle)
                }
            }
        )
    }
}

extension NavigationLink where Label == _SettingsNagivationLinkViewEmpty {
    init(
        _ icon: String,
        _ color: Color,
        _ title: String,
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        self.init(
            destination: destination,
            label: {
                HStack {
                    Image(systemName: icon)
                        .modifier(_SettingsImageModifier(color))
                    Text(title)
                    Spacer()
                    EmptyView()
                }
            }
        )
    }
}

extension HStack where Content == _SettingsToggleView {
    init(
        _ icon: String,
        _ color: Color,
        _ toggle: (label: String, isOn: Binding<Bool>)
    ) {
        self.init {
            Image(systemName: icon)
                .modifier(_SettingsImageModifier(color))
            Spacer()
            Toggle(isOn: toggle.isOn) {
                Text(toggle.label)
                    .font(.body)
            }
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
                    HStack("airplane", .orange, (label: "Airplane Mode", isOn: .constant(false)))

                    NavigationLink("wifi", .blue, "Wi-Fi", "Home-5G") {
                        Text("some text")
                    }

                    NavigationLink("dot.radiowaves.right", .blue, "Bluetooth", "On") {
                        Text("some text")
                    }

                    NavigationLink("antenna.radiowaves.left.and.right", .green, "Mobile Data") {
                        Text("Any Text")
                    }

                    NavigationLink("personalhotspot", .green, "Personal Hotspot", "Off") {
                        Text("Any Text")
                    }

                    NavigationLink("network", .blue, "VPN", "Off") {
                        Text("Any Text")
                    }
                }

                Section {
                    NavigationLink("bell.badge.fill", .red, "Notifications") {
                        Text("Any Text")
                    }

                    NavigationLink("speaker.wave.3.fill", .pink, "Sounds & Haptics") {
                        Text("Any Text")
                    }

                    NavigationLink("moon.fill", .indigo, "Do Not Disturb") {
                        Text("Any Text")
                    }

                    NavigationLink("hourglass", .indigo, "Screen Time") {
                        Text("Any Text")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationViewStyle(.stack)
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
                Text("Any Destination")
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
                    Text("Codebendr")
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
        WeSplitSettingsView().preferredColorScheme(.dark).previewInterfaceOrientation(.portraitUpsideDown)
        WeSplitSettingsView()
    }
}
