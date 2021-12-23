//
//  CustomButtons.swift
//  KlugViewDimension
//
//  Created by Evans Domina Attafuah on 08/11/2021.
//

import SwiftUI

struct CustomButtons: View {
    var body: some View {
        HStack {
        Button("One", action: {})
        Button("Two", action: {})
        Button("Three", action: {})
        }.buttonStyle(CircleStyle())
    }
}

struct CircleStyle: ButtonStyle {
    var foreground = Color.white
    var background = Color.blue
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
            .fill(background.opacity(configuration.isPressed ? 0.8 : 1))
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(configuration.label.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}

struct CustomButtons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtons()
    }
}
