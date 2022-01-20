import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack {
//            GeometryReader { proxy in
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: proxy.size.width * 0.5)
//            }
            
//            Text("Start")
//                .foregroundColor(.white)
//                .padding(10)
//                .background(
//                    GeometryReader { proxy in
//                        Circle()
//                            .fill(Color.blue)
//                            .frame(width: proxy.size.width,
//                                   height: proxy.size.width)
//                    })
            
            VStack {
                TextWithCircle()
                TextWithCircle()
                TextWithCircle()
            }
        }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}

struct WidthKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?,
                       nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

struct TextWithCircle: View {
    @State private var width: CGFloat? = nil
    var body: some View {
        Text("Hello, world")
            .padding()
            .background(GeometryReader { proxy in
                Color.clear.preference(key: WidthKey.self, value: proxy.size.width)
            })
            .onPreferenceChange(WidthKey.self) {
                self.width = $0
            }
            .frame(width: width, height: width)
            .background(Circle().fill(.blue))
    }
}
