//
//  CustomViews.swift
//  KlugViewDimension
//
//  Created by Evans Domina Attafuah on 08/11/2021.
//

import SwiftUI

struct CustomViews: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .circle()
            
//            CircleWrapper {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            }
//            
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).modifier(CircleModifier())
            
        }
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}


extension View {
    func circle(foreground: Color = .white, background: Color = .blue)
    -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(self.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}


