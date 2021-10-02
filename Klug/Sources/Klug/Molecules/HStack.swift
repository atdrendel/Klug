import SwiftUI

public extension Klug {

    typealias IconView = HStack<TupleView<(Image, TextField<Text>, AnyView)>>
}

public extension HStack where Content == Klug.IconView {
     init(
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: .center, spacing: spacing, content: content)
    }
}

