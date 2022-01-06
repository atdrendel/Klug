import Klug
import SwiftUI
import PlaygroundSupport

typealias SettingsToggleView = VStack<TupleView<(Label<Text, Image>, Toggle<Text>)>>
typealias SettingsNagivationLinkView = NavigationLink<VStack<TupleView<(Label<Text, Image>, AnyView)>>, Text>
typealias SettingsView = HStack<SettingsNagivationLinkView>


struct Preview: View {
    var body: some View {
        preview
        .frame(width: 320)
    }
    
    var preview: some View {
        HStack {
            Label {
                Text("title")
            } icon: {
                Image(systemName: "swift")
            }
          //  .labelStyle(.iconOnly)
            Spacer()
            Toggle("some text", isOn: .constant(false))
        }
    }
}

print(type(of: Preview().preview))

PlaygroundPage.current.setLiveView(Preview())
