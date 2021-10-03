import SwiftUI

public extension Klug {
    
    struct CustomView<Content: View>: View {
        let content: Content

        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        public var body: some View {
            content
        }
    }

    private struct PasswordView: View {
        var action: (Bool) -> ()
        @State private var isPasswordShowing = false
        
        public var body: some View {
            Group {
                isPasswordShowing ? Image(systemName: "eye.slash") : Image(systemName: "eye")
            }
            .onTapGesture {
                isPasswordShowing.toggle()
                action(isPasswordShowing)
            }
        }
    }
}

public extension Klug {

    typealias IconView<Accessory: View> = TupleView<(Image, TextField<Text>, AccessoryViewType<Accessory>)>
    
    enum ViewType {
        case stack
    }
    
    enum AccessoryViewType<Accessory: View>: View {
        case password(_ action: (Bool) -> ())
        case custom(_ view: Accessory )
        case none
        public var body: some View {
            switch self {
            case let .password(action):
                PasswordView(action: action)
            case let .custom(view): view
            case .none: EmptyView()
            }
        }
    }

}
