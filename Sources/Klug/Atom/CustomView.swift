import SwiftUI

public extension Klug {
    
    struct CustomView<Content:View> : View {
        let content: Content
        init(@ViewBuilder content: () -> Content) {  self.content = content() }
        public var body: some View { content }
    }

    struct _PasswordView: View {
        var action: (Bool) -> ()
        @State private var isPasswordShowing = false
        
        public var body: some View {
            Group { isPasswordShowing ?
                Image(systemName: "eye.slash") :
                Image(systemName: "eye")
            }
            .onTapGesture {
                isPasswordShowing.toggle()
                action(isPasswordShowing)
            }
        }
    }
}

struct Validation<Value>: ViewModifier {
    var value: Value
    var validator: (Value) -> Bool

    func body(content: Content) -> some View {
        // Here we use Group to perform type erasure, to give our
        // method a single return type, as applying the 'border'
        // modifier causes a different type to be returned:
        Group {
            if validator(value) {
                content.border(Color.green)
            } else {
                content
            }
        }
    }
}

public extension Klug {
    
    struct _TextFieldImageModifier: ViewModifier {
        public func body(content: Content) -> some View {
            content
                .opacity(0.8)
                .foregroundColor(.gray.opacity(0.3))
        }
    }
    
    typealias AccessoryModifiedContent = ModifiedContent<Image, _TextFieldImageModifier>
    typealias AccessoryConditionalContent = _ConditionalContent<SecureField<Text>, TextField<Text>>
    typealias AccessoryView = TupleView<(AccessoryModifiedContent, _TextField, AccessoryViewType)>
    typealias AccessoryViewImage = TupleView<(AccessoryModifiedContent, _TextField, Image)>
    typealias AccessoryViewShape = TupleView<(AccessoryModifiedContent, _TextField, AccessoryShapeType)>

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
