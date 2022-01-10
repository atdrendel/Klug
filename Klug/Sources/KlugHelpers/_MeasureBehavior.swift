import SwiftUI
import Foundation

public struct _MeasureBehavior<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    var content: Content
    public init(_ content: Content) {
        self.content = content
    }

    public var body: some View {
        VStack {
            content
                .border(Color.gray)
                .frame(width: width, height: height)
                .border(Color.black)
            Slider(value: $width, in: 0...500)
            Slider(value: $height, in: 0...200)
        }
    }
}
