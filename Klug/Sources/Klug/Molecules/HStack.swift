import SwiftUI
import Relative




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
    
    enum AccessoryViewType: View {
        case password(_ action: (Bool) -> ())
        case custom
        case none
        
        public var body: some View {
            switch self {
            case .password(_):
                CustomView {
                    Image(systemName: "eye.slash")
                }
            case .custom:
                CustomView {
                    Text("")
                }
            case .none:
                CustomView {
                    EmptyView()
                }
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

