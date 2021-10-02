import SwiftUI


public extension Klug {
    
    enum AccessoryViewType {
        case password(_ action: (Bool) -> ())
        case custom(_ view: AnyView)
        case none
    }
    
    typealias IconView = TupleView<(Image, TextField<Text>, AccessoryViewType)>
    
    enum ViewType {
        case stack
    }
}

public extension HStack where Content == Klug.IconView {
     init(
        type: Klug.ViewType,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: .center, spacing: 10, content: content)
    }
}

