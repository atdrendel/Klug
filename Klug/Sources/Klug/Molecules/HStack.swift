import SwiftUI
import Relative


public extension HStack where Content == Klug.IconView<AnyView> {
     init(
        type: Klug.ViewType,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: .center, spacing: 10, content: content)
    }
}

