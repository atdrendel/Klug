//
//  File.swift
//  
//
//  Created by Evans Domina Attafuah on 02/10/2021.
//

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
}

public extension View {
    func accessoryView(_ content: Klug.AccessoryViewType = .none) -> Klug.AccessoryViewType  { content }
}
