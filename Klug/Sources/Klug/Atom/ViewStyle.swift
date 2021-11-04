import SwiftUI

//extension View {
//    // If condition is met, apply modifier, otherwise, leave the view untouched
//    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
//        Group {
//            if condition {
//                self.modifier(modifier)
//            } else {
//                self
//            }
//        }
//    }
//
//    // Apply trueModifier if condition is met, or falseModifier if not.
//    public func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
//        Group {
//            if condition {
//                self.modifier(trueModifier)
//            } else {
//                self.modifier(falseModifier)
//            }
//        }
//    }
//}

extension View {
    
    public func border<C>(_ edges: Edge.Set, length: CGFloat? = nil, _ content: C, width: CGFloat = 1, cornerRadius: CGFloat = 10) -> some View where C : ShapeStyle {
        padding(edges, length).overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
    }
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

//AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2274509804, green: 0.4, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2156862745, green: 1, blue: 0.6235294118, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.9176470588, blue: 0.1960784314, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2039215686, blue: 0.2745098039, alpha: 1))]), center: .center)
//    .mask(Image(systemName: "circle.fill").resizable().font(.system(size: 66)))
//    .frame(width: 66, height: 66)
//    .if(!isLiteMode, transform: { view in
//        view.blur(radius: 10)
//    })
