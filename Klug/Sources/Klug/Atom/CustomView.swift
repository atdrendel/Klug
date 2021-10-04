import SwiftUI

public extension Klug.CustomView where Content == Rectangle {}
public extension Klug.CustomView where Content == Circle {}
public extension Klug.CustomView where Content == Image {}
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
    
    typealias AccessoryView = TupleView<(Image, _ConditionalContent<SecureField<Text>, TextField<Text>>, AccessoryViewType)>
    typealias CustomAccessoryView = _ConditionalContent<_ConditionalContent<Rectangle, Circle>, _ConditionalContent<Image, Text>>
    
    enum CustomAccessoryViewType: View {
        case rectangle(Rectangle)
        case circle(Circle)
        case image(Image)
        case text(Text)
        
        public var body: some View {
            Group {
                switch self {
                case let .rectangle(rectangle): rectangle
                case let .circle(circle): circle
                case let .image(image): image
                case let .text(text): text
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
            case let .custom(view) : view.frame(width: 20)
            case .none: EmptyView()
            }
        }
        
    }
    
}
