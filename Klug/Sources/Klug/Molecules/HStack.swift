import SwiftUI
import Relative




public extension Klug {
    
    enum AccessoryViewType: View {
        case password(_ action: (Bool) -> ())
        case custom
        case none
        public var body: some View {
            switch self {
            case let .password(action):
                PasswordView(action: action)
            case .custom:
                CustomView {
                    Text("")
                }
            case .none: EmptyView()
            }
        }
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

