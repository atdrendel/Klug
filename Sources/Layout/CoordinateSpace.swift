import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct CoordinateSpaceView: View {
    @State var float: CGFloat = 0.0
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(
                    key: ScrollPreferenceKey.self,
                    value: proxy.frame(in: .named("scroll")).minY
                )
            }
            .frame(height: 0)

            ForEach(0 ..< 5000) { _ in
                Text("Any View")
            }
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(
            ScrollPreferenceKey.self) { value in
                self.float = value
        }
        .overlay(
            Text("\(float)")
        )
    }
}

struct CoordinateSpacePreview: PreviewProvider {
    static var previews: some View {
        CoordinateSpaceView()
    }
}
