//
//  Styles.swift
//  KlugDesign
//
//  Created by Evans Domina Attafuah on 13/12/2021.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    let cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                //                .stroke(.black, style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [50, 10], dashPhase: 20))
                .stroke(.linearGradient(
                    colors: [
                        .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                        .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                    ], startPoint: .top,
                    endPoint: .bottom
                )
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
