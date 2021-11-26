//
//  Button.swift
//  KlugHabitTracker
//
//  Created by Evans Domina Attafuah on 25/11/2021.
//

import SwiftUI

struct HabitButtonStyle: ButtonStyle {
    
    var strokeColor: Color
    var fillColor: Color
    var fontColor: Color
    
    func makeBody(configuration: Self.Configuration)
    -> some View {
        configuration.label
            .font(.caption2)
            .frame(height:0)
            .padding()
            .foregroundColor(fontColor)
            .background(
                Capsule()
                    .fill(fillColor)
                    .overlay(
                        Capsule()
                            .stroke(strokeColor)
                    )
            )
    }
}

extension ButtonStyle where Self == HabitButtonStyle {
    
    static var primary: Self {
        HabitButtonStyle(
            strokeColor: .clear,
            fillColor: .init("lightBlue"),
            fontColor: .init("blue")
        )
    }
    
    static var secondary: Self {
        HabitButtonStyle(
            strokeColor: .white,
            fillColor: .init("seaBlue"),
            fontColor: .init("blue")
        )
    }
    
    static var accent: Self {
        HabitButtonStyle(
            strokeColor: .clear,
            fillColor: .init("lightGreen"),
            fontColor: .init("blue")
        )
    }
    
    static var alt: Self {
        HabitButtonStyle(
            strokeColor: .init("green"),
            fillColor: .init("seaBlue"),
            fontColor: .init("green")
        )
    }
}

struct HabitButton: View {
    let buttonStyle: HabitButtonStyle
    init(_ buttonStyle: HabitButtonStyle) {
        self.buttonStyle = buttonStyle
    }
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "mail.stack")
                Text("All Habits")
                Text("0")
            }
        }
        .buttonStyle(buttonStyle)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            Image("Buttons")
                .resizable()
                .frame(width: 379, height: 322)
            
            HabitButton(.primary)
            
            HabitButton(.secondary)
            
            HabitButton(.accent)
            
            HabitButton(.alt)
            
        }
        .padding()
        .background(Color("seaBlue"))
        .previewLayout(.sizeThatFits)
    }
}
