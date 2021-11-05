import SwiftUI

public extension Klug {
    
    struct CustomView<Content:View> : View {
        let content: Content

        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        public var body: some View {
            content
        }
    }

    struct _PasswordView: View {
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
    
    typealias AccessoryModifiedContent = ModifiedContent<Image, TextFieldImageModifier>
    typealias AccessoryConditionalContent = _ConditionalContent<SecureField<Text>, TextField<Text>>
    
    typealias AccessoryView = TupleView<(AccessoryModifiedContent, AccessoryConditionalContent, AccessoryViewType)>
    typealias AccessoryViewImage = TupleView<(AccessoryModifiedContent, AccessoryConditionalContent, Image)>
    typealias AccessoryViewShape = TupleView<(AccessoryModifiedContent, AccessoryConditionalContent, AccessoryShapeType)>

    enum AccessoryViewType: View {
        case password(_ action: (Bool) -> ())
        case none
        
        public var body: some View {
            switch self {
            case let .password(action): Klug._PasswordView(action: action)
            case .none: EmptyView()
            }
        }
    }
    
    enum AccessoryShapeType: View {
        case circle(_ color: Color)
        case rectangle(_ color: Color)
        
        public var body: some View {
            switch self {
            case let .circle(color) : Circle().fill(color).frame(width: 10, height: 10, alignment: .center)
            case let .rectangle(color) :    RoundedRectangle(cornerRadius: 6)
                    .fill(color)
                    .frame(width: 20, height: 20)
            }
        }
    }
    
}
