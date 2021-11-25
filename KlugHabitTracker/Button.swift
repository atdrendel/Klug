//
//  Button.swift
//  KlugHabitTracker
//
//  Created by Evans Domina Attafuah on 25/11/2021.
//

import SwiftUI

struct HabitButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration)
    -> some View {
        configuration.label
            .font(.caption)
            .frame(height:0)
            .padding()
            .background(
                Capsule()
                .fill(Color("seaBlue"))
            )
            
    }
}

struct HabitButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "mail.stack")
                Text("All Habits")
                Text("0")
            }
        }
        .buttonStyle(HabitButtonStyle())
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            Image("Buttons")
                .resizable()
                .frame(width: 379, height: 322)
            
            HabitButton()
            
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
