import SwiftUI

public extension Klug {
    
    struct CustomView<Content> : View where Content : View {
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
    
    struct TextFieldImageModifier: ViewModifier {
        public func body(content: Content) -> some View {
            content
                .opacity(0.8)
                .foregroundColor(.gray.opacity(0.3))
        }
    }
    
    typealias AccessoryView = TupleView<(ModifiedContent<Image, TextFieldImageModifier>, _ConditionalContent<SecureField<Text>, TextField<Text>>, AccessoryViewType)>
    typealias CustomAccessoryView = _ConditionalContent<_ConditionalContent<Rectangle, Circle>, _ConditionalContent<Image, Text>>
    
    enum CustomAccessoryViewType: View {
        case rectangle(color: Color)
        case circle(color: Color)
        case image(named: Image)
        
        public var body: some View {
            Group {
                switch self {
                case let .rectangle(color): Rectangle().fill(color)
                case let .circle(color): Circle().fill(color)
                case let .image(image): image
                }
            }
        }
    }
  
    enum AccessoryViewType: View {
        case password(_ action: (Bool) -> ())
        case custom( _ view: CustomAccessoryViewType)
        case none
        
        public var body: some View {
            switch self {
            case let .password(action): PasswordView(action: action)
            case let .custom(view) : view.frame(width: 20, height: 20)
            case .none: EmptyView()
            }
        }
        
    }
    
}
